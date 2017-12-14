//
//  NSObject+shp_validate.m
//  LKHealthClub
//
//  Created by songhuipan on 2017/12/14.
//  Copyright © 2017年 songhuipan. All rights reserved.
//

#import "NSObject+shp_validate.h"

@implementation NSObject (shp_validate)
- (BOOL)shp_validate {
   
    BOOL result = NO;
    
    if (self != nil && (NSNull *)self != [NSNull null]) {
        
        if ([self isKindOfClass:[NSString class]] ) {
            
            NSString *str = [(NSString *)self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            result = [str isEqualToString:@""]?NO:YES;
            
        }else if ([self isKindOfClass:[NSArray class]]) {
            
            result = [(NSArray *)self count];
            
        }else if ([self isKindOfClass:[NSDictionary class]]) {
            
            result = [(NSDictionary *)self count];
            
        }else {
            
            result = YES;
        }
        
    }
    
    return result;

}
@end
