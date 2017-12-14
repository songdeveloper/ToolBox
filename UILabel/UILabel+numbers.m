//
//  UILabel+numbers.m
//  KKNewHealth
//
//  Created by songhuipan on 2016/12/22.
//  Copyright © 2016年 kk. All rights reserved.
//

#import "UILabel+numbers.h"

@implementation UILabel (numbers)
- (CGFloat)numberOfText{
    // 获取单行时候的内容的size
    CGSize singleSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    // 获取多行时候,文字的size
    CGSize textSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    // 返回计算的行数
    return ceil( textSize.height / singleSize.height);
}
@end
