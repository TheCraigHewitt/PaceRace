//
//  SetHeightViewController.m
//  Pace Race
//
//  Created by Craig Hewitt on 10/11/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import "SetHeightViewController.h"

@interface SetHeightViewController ()

@end

@implementation SetHeightViewController

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
    
    int rowInt = 5;
    int componentInt = 0;
    feetList = [[NSMutableArray alloc] init];
    for (int i=4; i<=7; i++){
        [feetList addObject:[NSString stringWithFormat:@"%d",i]];
    }
    int inchesInt = 0;
    int inchesComp = 1;
    inchesList = [[NSMutableArray alloc] init];
    for (int i=0; i<=11; i++){
        [inchesList addObject:[NSString stringWithFormat:@"%d", i]];
    }
    [self.heightPicker selectRow:rowInt inComponent:componentInt animated:NO];
    [self.heightPicker selectRow: inchesInt inComponent:inchesComp animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    if(component== 0)
    {
        return [feetList count];
    }
    else
    {
        return [inchesList count];
    }
}
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if(component == 0)
    {
        return [feetList objectAtIndex:row];
    }
    else
    {
        return [inchesList objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component{
    if(component==0)
    {
        self.heightLabel.text = [feetList objectAtIndex:row];
    }
    else{
    self.inchesLabel.text = [inchesList objectAtIndex: row];
    }
    totalHeight = [NSString stringWithFormat:@"%@' %@\"", self.heightLabel.text, self.inchesLabel.text, nil];
}
- (IBAction)setHeightButton:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:totalHeight forKey:@"PRUserHeight"];
    [defaults synchronize];
    [self.navigationController popViewControllerAnimated:YES];

}
@end
