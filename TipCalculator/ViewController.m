//
//  ViewController.m
//  TipCalculator
//
//  Created by Dan Weng on 6/10/15.
//  Copyright (c) 2015 com.danweng. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billtext;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateVaule;
- (void)getTipValue;


@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [self getTipValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateVaule];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateVaule];
    //[self setTipValue];
}

- (void)updateVaule{
    float billAmt = [self.billtext.text floatValue];
    NSArray *tipArr = @[@(0.1), @(0.15), @(0.2)];
    
    float tipAmt = billAmt *
          [tipArr[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmt = billAmt + tipAmt;
    
    self.tipLabel.text = [NSString stringWithFormat:@"%0.2f", tipAmt];
    self.totalLabel.text = [NSString stringWithFormat:@"%0.2f", totalAmt];
}

-(void)getTipValue{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long intValue = [defaults integerForKey:@"tipdefault"];
    self.tipControl.selectedSegmentIndex = intValue;
    
}

/*
- (void)setTipValue{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long tipIndex = self.tipControl.selectedSegmentIndex;
    [defaults setInteger:tipIndex forKey:@"tipdefault"];
    [defaults synchronize];
}
*/
@end
