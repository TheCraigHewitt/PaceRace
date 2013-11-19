//
//  PreferencesListViewController.h
//  Pace Race
//
//  Created by Craig Hewitt on 10/3/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"

@interface PreferencesListViewController : UITableViewController  <UITableViewDelegate, UITableViewDataSource>
{
    NSString * PRUsernameText;
    NSString * PRUserAgeText ;
    NSString * PRUserGenderText ;
    NSString * PRUserHeightText;
    NSString * PRUserWeightText ;
    NSString * PRUserLoctionText ;
    NSString * PRUserFBShareText;
    NSString * PRUserTwitterShareText;

}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;




@end
