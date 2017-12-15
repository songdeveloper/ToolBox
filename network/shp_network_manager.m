
//
//  shp_network_manager.m
//  LKHealthClub
//
//  Created by songhuipan on 2017/12/15.
//  Copyright © 2017年 songhuipan. All rights reserved.
//

#import "shp_network_manager.h"
#import <AFNetworking.h>
@implementation shp_network_manager

+ (NSURLSessionDataTask *)post:(NSString *)URLString
                    parameters:(id)parameters encrypt:(BOOL)encrypt
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10.0;
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    
    return [manager POST:URLString parameters:parameters progress:nil success:success failure:failure];
    
}
@end
