//
//  UIColor+TraditionalColor.m
//  TraditionalColor
//
//  Created by andong on 15/8/14.
//  Copyright (c) 2015年 AN Dong. All rights reserved.
//

#import "UIColor+TraditionalColor.h"

//Quick & Easy Shorthand for RGB x HSB Colors - The reason we don't import our Macro file is to prevent naming conflicts.
#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define rgb(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]
#define hsba(h,s,b,a) [UIColor colorWithHue:h/360.0f saturation:s/100.0f brightness:b/100.0f alpha:a]
#define hsb(h,s,b) [UIColor colorWithHue:h/360.0f saturation:s/100.0f brightness:b/100.0f alpha:1.0]

@implementation UIColor (TraditionalColor)

+ (NSInteger)generateRandomNumberWithMax:(NSInteger)max {
    
    //Choose a random number between 0 and our number of available colors
    return arc4random_uniform((UInt32)max);
}

+ (NSArray *)traditionalColors {
    // 19 colors
    return @[[UIColor yanzhiColor], [UIColor yabaiColor], [UIColor zhuqingColor], [UIColor daiColor], [UIColor tuoseColor], [UIColor qiuxiangseColor], [UIColor dianqingColor], [UIColor chabaiColor], [UIColor yaqingColor], [UIColor tanColor], [UIColor chiColor], [UIColor wanColor], [UIColor shuilvColor], [UIColor yanColor], [UIColor liColor], [UIColor aiqingColor], [UIColor dailanColor], [UIColor yuebaiColor], [UIColor feiseColor]];
}

+ (NSString *)nameOfTraditionalColor:(UIColor *)color {
    NSUInteger index = [[self traditionalColors] indexOfObject:color];
    if (index == NSNotFound) {
        return nil;
    }
    NSArray *traditionalColorNames = @[@"胭脂", @"牙白", @"竹青", @"黛", @"驼色", @"秋香色", @"靛青", @"茶白", @"鸦青", @"檀", @"赤", @"绾", @"水绿", @"炎", @"黎", @"艾青", @"黛蓝", @"月白", @"妃色"];
    return [traditionalColorNames objectAtIndex:index];
}

+ (UIColor *)randomTraditionalColor {
    
    //Number of colors to choose from
    const uint32_t numberOfPossibleColors = 19; // [0, 18]
    
    //Chose one of those colors at random
    NSInteger randomColorChosen = [[self class] generateRandomNumberWithMax:numberOfPossibleColors];
    
    //Check if a previous random number exists
    if (![[NSUserDefaults standardUserDefaults] integerForKey:@"previousRandomNumber"]) {
        
        //If no previous number exists, save it as such and find the matching color
        [[NSUserDefaults standardUserDefaults] setInteger:randomColorChosen forKey:@"previousRandomNumber"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    } else {
        
        //Keep generating a random number until it is different than the one generated last time
        while (randomColorChosen == [[NSUserDefaults standardUserDefaults] integerForKey:@"previousRandomNumber"]) {
            randomColorChosen = [[self class] generateRandomNumberWithMax:numberOfPossibleColors];
        }
        
        //Once a new number has been generated then store it as the previous number for next time and proceed
        [[NSUserDefaults standardUserDefaults] setInteger:randomColorChosen forKey:@"previousRandomNumber"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

    return [[self traditionalColors] objectAtIndex:randomColorChosen];
}

- (NSArray *)rgbaArray
{
    CGFloat r=0,g=0,b=0,a=0;
    
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    }
    else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    
    return @[@(r),
             @(g),
             @(b),
             @(a)];
}

+ (UIColor *)contrastingColorOfColor:(UIColor *)color
{
    NSArray *rgbaArray = [color rgbaArray];
    double a = 1 - ((0.299 * [rgbaArray[0] doubleValue]) + (0.587 * [rgbaArray[1] doubleValue]) + (0.114 * [rgbaArray[2] doubleValue]));
    return a < 0.5 ? [[self class] blackColor] : [[self class] whiteColor];
}

+ (UIColor *)yanzhiColor {
    return rgb(157, 41, 50);
}

+ (UIColor *)yabaiColor {
    return rgb(239, 222, 176);
}

+ (UIColor *)zhuqingColor {
    return rgb(120, 146, 98);
}

+ (UIColor *)daiColor {
    return rgb(73, 65, 102);
}

+ (UIColor *)tuoseColor {
    return rgb(168, 132, 98);
}

+ (UIColor *)qiuxiangseColor {
    return rgb(217, 182, 18);
}

+ (UIColor *)dianqingColor {
    return rgb(23, 124, 176);
}

+ (UIColor *)chabaiColor {
    return rgb(243, 248, 241);
}

+ (UIColor *)yaqingColor {
    return rgb(66, 75, 80);
}

+ (UIColor *)tanColor {
    return rgb(179, 109, 970);
}

+ (UIColor *)chiColor {
    return rgb(195, 39, 43);
}

+ (UIColor *)wanColor {
    return rgb(169, 129, 117);
}

+ (UIColor *)shuilvColor {
    return rgb(212, 242, 232);
}

+ (UIColor *)yanColor {
    return rgb(255, 51, 0);
}

+ (UIColor *)liColor {
    return rgb(118, 102, 77);
}

+ (UIColor *)aiqingColor {
    return rgb(163, 226, 197);
}

+ (UIColor *)dailanColor {
    return rgb(65, 80, 101);
}

+ (UIColor *)yuebaiColor {
    return rgb(215, 236, 241);
}

+ (UIColor *)feiseColor {
    return rgb(237, 87, 254);
}

@end
