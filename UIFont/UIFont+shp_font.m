//
//  UIFont+shp_font.m
//  shp_alpha_one
//
//  Created by songhuipan on 2017/12/26.
//  Copyright © 2017年 songhuipan. All rights reserved.
//
// 实现项目中font自动调整的效果，以iPhone6为基本设计机型
#import "UIFont+shp_font.h"
#import <objc/runtime.h>

#define KSCREEN_WIDTH 375
@implementation UIFont (shp_font)
+ (void)load {
    Method systemFont = class_getClassMethod([self class], @selector(systemFontOfSize:));
    Method adjustFont = class_getClassMethod([self class], @selector(adjustFontOfSize:));
    method_exchangeImplementations(systemFont, adjustFont);
}
+ (UIFont *)adjustFontOfSize:(CGFloat)fontSize {
    
    UIFont *font = nil;
    font = [UIFont adjustFontOfSize:fontSize * [UIScreen mainScreen].bounds.size.width/KSCREEN_WIDTH];
    return font;
}
@end
