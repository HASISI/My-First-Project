//
//  TestService.m
//  test
//
//  Created by Mr.Ou on 2021/2/25.
//

#import "TestService.h"

@implementation TestService

+ (instancetype)shareManager {
    static TestService *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (void)GetUrlStr:(NSString *)urlString WithSuccessBlock:(successBlock)block WithFailBlock:(failBlock)errorBlock {
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager = [AFHTTPSessionManager manager];
    // -- 返回数据的序列化器，大部分是用AFJSONResponseSerializer，可在这里做相应修改 --
    AFHTTPResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/json", @"text/javascript", @"text/html", @"image/jpeg", nil];
    sessionManager.responseSerializer = responseSerializer;
    // 请求参数的序列化器
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    sessionManager.requestSerializer = requestSerializer;
    [sessionManager GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            block(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error) {
                errorBlock(error);
            }
        }];
}

@end
