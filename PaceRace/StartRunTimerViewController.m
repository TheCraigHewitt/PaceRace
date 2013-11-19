//
//  StartRunTimerViewController.m
//  Pace Race
//
//  Created by Craig Hewitt on 9/28/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import "StartRunTimerViewController.h"

@interface StartRunTimerViewController ()

@end

@implementation StartRunTimerViewController
@synthesize myCounterLabel;

int seconds;
int secondsLeft;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    secondsLeft = 3;
    [self countdownTimer];
}
    
- (void)updateCounter:(NSTimer *)theTimer {
    
    if(secondsLeft > 0 ){
            secondsLeft -- ;
            seconds = (secondsLeft %3600) % 60;
            myCounterLabel.text = [NSString stringWithFormat:@"%02d",  seconds];
    }
    else{
        secondsLeft = 3;
    }
    
    if(secondsLeft == 0)
        [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)countdownTimer{
        
    secondsLeft = seconds = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
