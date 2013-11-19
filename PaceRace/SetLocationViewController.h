//
//  SetLocationViewController.h
//  Pace Race
//
//  Created by Craig Hewitt on 10/11/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SetLocationViewController : UIViewController <UITextFieldDelegate>
- (IBAction)setLocationButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *locationText;

@end
