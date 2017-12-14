//
//  NSObject+shp_validate.h
//  LKHealthClub
//
//  Created by songhuipan on 2017/12/14.
//  Copyright © 2017年 songhuipan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (shp_validate)
/// 校验一个字符串(附带去掉首尾空格)，字典，数组是否为空
- (BOOL)shp_validate;
@end
