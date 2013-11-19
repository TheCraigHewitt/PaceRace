//
//  SetWeightViewController.m
//  Pace Race
//
//  Created by Craig Hewitt on 10/10/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import "SetWeightViewController.h"

@interface SetWeightViewController ()

@end

@implementation SetWeightViewController

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
    
    int rowInt = 50;
    int componentInt = 0;
    weightList = [[NSMutableArray alloc] init];
    for (int i=80; i<=350; i++){
        [weightList addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [self.weightPicker selectRow:rowInt inComponent:componentInt animated:NO];
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
    
    return [weightList count];
}
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [weightList objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component{
    self.weightLabel.text = [weightList objectAtIndex:row];
}
- (IBAction)setWeightButton:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:self.weightLabel.text forKey:@"PRUserWeight"];
    [defaults synchronize];
    [self.navigationController popViewControllerAnimated:YES];

}
@end
