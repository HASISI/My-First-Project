//
//  OUProgressHUD.h
//  test
//
//  Created by Mr.Ou on 2021/3/10.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

#define HUD [OUProgressHUD shareManager]

@interface OUProgressHUD : NSObject

+ (instancetype)shareManager;

/**
 成功提示
 @param message 成功提示信息
 */
- (void)successHUD:(NSString *)message;
/**
失败提示
 */
- (void)failHUD;
/**
进度条圆环提示
 */
- (void)determineHUD:(void(^)(void))completeBlock;

@end

NS_ASSUME_NONNULL_END
