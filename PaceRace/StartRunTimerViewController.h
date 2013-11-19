//
//  StartRunTimerViewController.h
//  Pace Race
//
//  Created by Craig Hewitt on 9/28/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartRunTimerViewController : UIViewController
{
NSTimer *timer;
IBOutlet UILabel *myCounterLabel;
}

@property (nonatomic, retain) UILabel *myCounterLabel;
-(void)updateCounter:(NSTimer *)theTimer;
-(void)countdownTimer;

@end
