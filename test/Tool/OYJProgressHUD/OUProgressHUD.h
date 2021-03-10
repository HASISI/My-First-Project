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
 @param message 成功提示信息
 */
- (void)successHUD:(NSString *)message;


@end

NS_ASSUME_NONNULL_END
