//
//  shp_network_manager.h
//  LKHealthClub
//
//  Created by songhuipan on 2017/12/15.
//  Copyright © 2017年 songhuipan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shp_network_manager : NSObject

+ (NSURLSessionDataTask *)post:(NSString *)URLString
                    parameters:(id)parameters encrypt:(BOOL)encrypt
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
