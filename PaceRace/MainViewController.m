//
//  MainViewController.m
//  Pace Race
//
//  Created by Craig Hewitt on 8/24/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "SocketIOPacket.h"


@interface MainViewController ()
{
    BOOL running;
    NSTimeInterval secondsAlreadyRun;
    NSString *finalTime;
    NSString *finalDistance;
    NSString *finalPace;
    float shortDistance;

}

@property (strong, nonatomic) NSTimer *stopWatchTimer; // Store the timer that fires after a certain time
@property (strong, nonatomic) NSDate *startDate; // Stores the date of the click on the start button *
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation MainViewController
@synthesize oldLocation;

- (AppDelegate *)appDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers {
	return NO;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    //CL Location Manager
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 5.0;
    self.locationManager.delegate = self;

    [self.locationManager startUpdatingLocation];
    
    self.location = [[CLLocation alloc] init];

    self.title = @"Race";
    
    // Change button color
    _sidebarButton.tintColor = [UIColor greenColor];
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    
    //socket connection
    _socketIO = [[SocketIO alloc] initWithDelegate:self];
    [_socketIO connectToHost:@"localhost" onPort:3000];
    [_socketIO sendEvent:@"join" withData:@"iOSuser"];
}

- (void) viewWillAppear:(BOOL)animated
{
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"StartRunTimer"];
    [self presentViewController:viewController animated:YES completion:nil];
    


}



- (void)viewDidDisappear:(BOOL)animated {

	[super viewDidDisappear:animated];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setMapView:nil];
    // Release any retained subviews of the main view.

    
}

-(IBAction)sendMsg:(id)sender {
    [_socketIO sendEvent:@"message" withData:_distanceRun.text];
    [self addNewEventWithNickName:@"iOSuser" AndMessage:_distanceRun.text];
    _distanceRun.text = @"";
    
}

-(void)addNewEventWithNickName:(NSString*)nickname AndMessage:(NSString*)message
{
    _oppDistance.text = [_oppDistance.text stringByAppendingFormat:@"%@ - %@\n",nickname,message];
    
    
    
}
# pragma mark -
# pragma mark socket.IO-objc delegate methods

- (void) socketIODidConnect:(SocketIO *)socket
{
    NSLog(@"socket.io connected.");
}

- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet
{
    NSLog(@"didReceiveEvent()");
    
    if([packet.name isEqualToString:@"message"])
    {
        NSArray* args = packet.args;
        NSDictionary* arg = args[0];
        
        [self addNewEventWithNickName:arg[@"nickname"] AndMessage:arg[@"message"]];
        
    }
}

- (void) socketIO:(SocketIO *)socket onError:(NSError *)error
{
    NSLog(@"onError() %@", error);
}


- (void) socketIODidDisconnect:(SocketIO *)socket disconnectedWithError:(NSError *)error
{
    NSLog(@"socket.io disconnected. did error occur? %@", error);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTimer
{
    // Create date from the elapsed time
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:self.startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    // Create a date formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    // Format the elapsed time and set it to the label
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
    self.stopwatchLabel.text = timeString;
}



- (void)viewDidAppear:(BOOL)animated  {
    self.startDate = [NSDate date];
    
    // Create the stop watch timer that fires every 10 ms
    self.stopWatchTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0
                                                           target:self
                                                         selector:@selector(updateTimer)
                                                         userInfo:nil
                                                          repeats:YES];
    running = true;

}


//CL updates method
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation* newLocation = [locations lastObject];
    
    NSTimeInterval age = -[newLocation.timestamp timeIntervalSinceNow];
    
    if (age > 120) return;    // ignore old (cached) updates
    
    if (newLocation.horizontalAccuracy < 0) return;   // ignore invalid udpates
    
    // EDIT: need a valid oldLocation to be able to compute distance
    if (self.oldLocation == nil || self.oldLocation.horizontalAccuracy < 0) {
        self.oldLocation = newLocation;
        return;
    }
    
    CLLocationDistance distance = [newLocation distanceFromLocation: self.oldLocation];
    
   /* NSLog(@"%6.6f/%6.6f to %6.6f/%6.6f for %2.0fm, accuracy +/-%2.0fm",
          self.oldLocation.coordinate.latitude,
          self.oldLocation.coordinate.longitude,
          newLocation.coordinate.latitude,
          newLocation.coordinate.longitude,
          distance,
          newLocation.horizontalAccuracy);
*/
    self.oldLocation = newLocation;    // save newLocation for next time
    // convert speed to usable label
    float distanceMoved = 0.0;
    float convDist = (float) distance;
    if((running=true)) {
        distanceMoved += convDist;
    }
    NSString* formattedNumber = [NSString stringWithFormat:@"%.02f", distanceMoved];
    //NSLog(@"total Distance is %@", formattedNumber);
    self.location = locations.lastObject;
    NSString * formattedSpeed = [NSString stringWithFormat:@"%.02f", self.location.speed];
    self.speed.text = [NSString stringWithFormat:formattedSpeed];
    self.distanceRun.text = [NSString stringWithFormat:@"%@", formattedNumber];
    
    [_socketIO sendEvent:@"message" withData:_distanceRun.text];
    [self addNewEventWithNickName:@"iOSuser" AndMessage:_distanceRun.text];
    _distanceRun.text = @"";
    
}
- (IBAction)pauseRunTimer:(id)sender {
    running = false;
    NSDate *pausedDate = [[NSDate alloc]init];
    secondsAlreadyRun += [[NSDate date] timeIntervalSinceDate:pausedDate];

    self.stopwatchLabel.text = finalTime;
    self.distanceRun.text = finalDistance;
    self.speed.text = finalPace;
    }

@end