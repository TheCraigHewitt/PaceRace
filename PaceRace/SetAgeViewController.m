//
//  SetAgeViewController.m
//  Pace Race
//
//  Created by Craig Hewitt on 10/10/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import "SetAgeViewController.h"
#import "AppDelegate.h"
@interface SetAgeViewController ()

@property (strong, nonatomic) NSString *age;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation SetAgeViewController
@synthesize age;
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
    
    /*self.managedObjectContext = [[[SMClient defaultClient] coreDataStore] contextForCurrentThread];
    //self.ageLabel.text = self;
    
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    
    [newManagedObject setValue:@"age here" forKey:@"age"];
    self.age = [newManagedObject assignObjectId];
    [newManagedObject setValue:self.age forKey:[newManagedObject primaryKeyField]];
    
    NSError *error = nil;
    if (![self.managedObjectContext saveAndWait:&error]) {
        NSLog(@"There was an error! %@", error);
    }
    else {
        NSLog(@"You created a new object!");
    }
*/
    int rowInt = 20;
    int componentInt = 0;
    data = [[NSMutableArray alloc] init];
    for (int i=10; i<=100; i++){
        [data addObject:[NSString stringWithFormat:@"%d",i]];
         }
    [self.agePicker selectRow:rowInt inComponent:componentInt animated:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [data count];
}
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [data objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component{
    self.ageLabel.text = [data objectAtIndex:row];
}

- (IBAction)setAgeButton:(id)sender {
    /*
     NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    NSPredicate *predicte = [NSPredicate predicateWithFormat:@"age == %@", self.age];
    [fetchRequest setPredicate:predicte];
    
    [self.managedObjectContext executeFetchRequest:fetchRequest onSuccess:^(NSArray *results) {
        
        NSManagedObject *todoObject = [results objectAtIndex:0];
        [todoObject setValue:self.ageLabel.text forKey:@"age"];
        
        [self.managedObjectContext saveOnSuccess:^{
            NSLog(@"You updated the todo object!");
        } onFailure:^(NSError *error) {
            NSLog(@"There was an error! %@", error);
        }];
        
    } onFailure:^(NSError *error) {
        
        NSLog(@"Error fetching: %@", error);
        
    }];
     */
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:self.ageLabel.text forKey:@"PRUserAge"];
    [defaults synchronize];

    [self.navigationController popViewControllerAnimated:YES];
}
@end
    
