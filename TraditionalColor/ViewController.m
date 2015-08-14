//
//  ViewController.m
//  TraditionalColor
//
//  Created by andong on 15/8/14.
//  Copyright (c) 2015年 AN Dong. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+TraditionalColor.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)randomColor:(UIButton *)sender {
    UIColor *color = [UIColor randomTraditionalColor];
    self.text.backgroundColor = color;
    self.text.textColor = [UIColor contrastingColorOfColor:color];
    self.label.text = [UIColor nameOfTraditionalColor:color];
}

@end
