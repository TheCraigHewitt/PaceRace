//
//  SetHeightViewController.h
//  Pace Race
//
//  Created by Craig Hewitt on 10/11/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SetHeightViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSMutableArray *feetList;
    NSMutableArray *inchesList;
    NSString *totalHeight;
}
@property (strong, nonatomic) IBOutlet UIPickerView *heightPicker;
@property (strong, nonatomic) IBOutlet UILabel *heightLabel;
@property (strong, nonatomic) IBOutlet UILabel *inchesLabel;
- (IBAction)setHeightButton:(id)sender;

@end
