//
//  SetUsernameViewController.h
//  Pace Race
//
//  Created by Craig Hewitt on 10/11/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SetUsernameViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) IBOutlet UILabel *loggedInUsername;
@property (strong, nonatomic) IBOutlet UILabel *visibleUsername;
- (IBAction)saveUsername:(id)sender;

@end
