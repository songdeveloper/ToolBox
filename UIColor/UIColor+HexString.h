//
//  UIColor+HexString.h
//  Swiss
//
//  Created by Haoran on 13-6-9.
//  Copyright (c) 2013年 it. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexString)

+ (UIColor *) colorWithHexString: (NSString *)stringToConvert alpha:(CGFloat)alpha;
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;

@end
