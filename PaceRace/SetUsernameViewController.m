//
//  SetUsernameViewController.m
//  Pace Race
//
//  Created by Craig Hewitt on 10/11/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import "SetUsernameViewController.h"
#import "AppDelegate.h"

@interface SetUsernameViewController ()

@end

@implementation SetUsernameViewController
@synthesize visibleUsername;

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
    /*
    //get user info and ensure they're logged in
    [[SMClient defaultClient] getLoggedInUserOnSuccess:^(NSDictionary *userInfo){
        // Result contains a dictionary representation of the user object
        NSLog(@"logged in user info: %@", userInfo);
        self.loggedInUsername = [userInfo objectForKey:@"username"];
    } onFailure:^(NSError *notLoggedIn){
        // Error
        NSLog(@"not logged in, yo");
    }];
      */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (IBAction)saveUsername:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:self.visibleUsername.text forKey:@"PRUsername"];
    [defaults synchronize];
    
    NSManagedObject *newUsername = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    
    //populate object with names of runners (logged in user and selected row username)
    [newUsername setValue:visibleUsername.text forKey:@"visibleUsername"];
    [newUsername setValue:[newUsername assignObjectId] forKey:[newUsername primaryKeyField]];
    [self.managedObjectContext saveOnSuccess:^{
        NSLog(@"You created a new object!");
    } onFailure:^(NSError *error) {
        NSLog(@"There was an error! %@", error);
    }];
    
    [self.navigationController popViewControllerAnimated:YES];

}
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self updateTextLabelsWithText: newString];
    
    return YES;
}

-(void)updateTextLabelsWithText:(NSString *)string
{
    
    [visibleUsername setText:string];
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    NSLog(@"textFieldShouldClear:");
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textFieldShouldReturn:");
    if (textField.tag == 1) {
        UITextField *passwordTextField = (UITextField *)[self.view viewWithTag:2];
        [passwordTextField becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
    }
    return YES;
}

@end
