//
//  UIColor+TraditionalColor.h
//  TraditionalColor
//
//  Created by andong on 15/8/14.
//  Copyright (c) 2015年 AN Dong. All rights reserved.
//

// UIColor+TraditionalColor is an extension of UIColor that facilitates the use of Chinese traditional colors.
// This is a shorter list of traditional colors compared to others, including 19 classical colors, which is originally used in my own app.
// It also supports random traditional color, name of traditional color(for display), and the corresponding readable text color.
// Some of the code belongs to Colours and Chameleon Framework.
// Feel free to use or change it.

#import <UIKit/UIKit.h>

@interface UIColor (TraditionalColor)

+ (UIColor *)randomTraditionalColor;
+ (NSString *)nameOfTraditionalColor:(UIColor *)color;
+ (UIColor *)contrastingColorOfColor:(UIColor *)color;

+ (UIColor *)yanzhiColor;
+ (UIColor *)yabaiColor;
+ (UIColor *)zhuqingColor;
+ (UIColor *)daiColor;
+ (UIColor *)tuoseColor;
+ (UIColor *)qiuxiangseColor;
+ (UIColor *)dianqingColor;
+ (UIColor *)chabaiColor;
+ (UIColor *)yaqingColor;
+ (UIColor *)tanColor;
+ (UIColor *)chiColor;
+ (UIColor *)wanColor;
+ (UIColor *)shuilvColor;
+ (UIColor *)yanColor;
+ (UIColor *)liColor;
+ (UIColor *)aiqingColor;
+ (UIColor *)dailanColor;
+ (UIColor *)yuebaiColor;
+ (UIColor *)feiseColor;

@end
