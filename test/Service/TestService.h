//
//  TestService.h
//  test
//
//  Created by Mr.Ou on 2021/2/25.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^successBlock)(id dic);
typedef void(^failBlock)(NSError *error);

@interface TestService : NSObject

+ (instancetype)shareManager;
- (void)GetUrlStr:(NSString *)urlString WithSuccessBlock:(successBlock)block WithFailBlock:(failBlock)errorBlock;
@end

NS_ASSUME_NONNULL_END
