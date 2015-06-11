//
//  SettingsUIViewController.m
//  TipCalculator
//
//  Created by Dan Weng on 6/10/15.
//  Copyright (c) 2015 com.danweng. All rights reserved.
//

#import "SettingsUIViewController.h"

@interface SettingsUIViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *settingTipControl;

- (void)setTipValue;

- (IBAction)tipControll:(id)sender;

-(void)getTipValue;
@end

@implementation SettingsUIViewController

- (void)viewWillAppear:(BOOL)animated{
    [self getTipValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTipValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTipValue{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long tipIndex = self.settingTipControl.selectedSegmentIndex;
    [defaults setInteger:tipIndex forKey:@"tipdefault"];
    [defaults synchronize];
}

- (IBAction)tipControll:(id)sender {
    [self setTipValue];
}

-(void)getTipValue{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long intValue = [defaults integerForKey:@"tipdefault"];
    self.settingTipControl.selectedSegmentIndex = intValue;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
