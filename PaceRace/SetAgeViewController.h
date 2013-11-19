//
//  SetAgeViewController.h
//  Pace Race
//
//  Created by Craig Hewitt on 10/10/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface SetAgeViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource,NSFetchedResultsControllerDelegate>

{
    NSMutableArray *data ;

}
@property (strong, nonatomic) IBOutlet UIPickerView *agePicker;

@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
- (IBAction)setAgeButton:(id)sender;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
