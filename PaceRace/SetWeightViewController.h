//
//  SetWeightViewController.h
//  Pace Race
//
//  Created by Craig Hewitt on 10/10/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetWeightViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *weightList;
}
@property (strong, nonatomic) IBOutlet UIPickerView *weightPicker;

@property (strong, nonatomic) IBOutlet UILabel *weightLabel;
- (IBAction)setWeightButton:(id)sender;

@end
