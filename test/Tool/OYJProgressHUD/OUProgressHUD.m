//
//  OUProgressHUD.m
//  test
//
//  Created by Mr.Ou on 2021/3/10.
//

#import "OUProgressHUD.h"

static OUProgressHUD *instance;

@interface OUProgressHUD () <MBProgressHUDDelegate>

@end

@implementation OUProgressHUD

+ (instancetype)shareManager {
    instance = nil;
    instance = [self new];
    return instance;
}

- (void)successHUD:(NSString *)message {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].windows.firstObject animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *img = [[UIImage imageNamed:@"正确"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    hud.customView = [[UIImageView alloc] initWithImage:[img ScaleImage:img toScale:0.3]];
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:1];
}

- (void)failHUD {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].windows.firstObject animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *img = [[UIImage imageNamed:@"错误"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    hud.customView = [[UIImageView alloc] initWithImage:[img ScaleImage:img toScale:0.2]];
    hud.label.text = @"错误";
    [hud hideAnimated:YES afterDelay:1];
}

- (void)determineHUD:(void (^)(void))completeBlock {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].windows.firstObject animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    NSProgress *progress = [self doSomethingInBackgroundCompletion:^{
        completeBlock();
        [hud hideAnimated:YES];
    }];
    hud.progressObject = progress;
}

- (NSProgress *)doSomethingInBackgroundCompletion:(void(^)(void))doSome {
    NSProgress *pro = [[NSProgress alloc] init];
    pro.totalUnitCount = 100;
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval:0.005 repeats:YES block:^(NSTimer * _Nonnull timer) {
        pro.completedUnitCount += 1;
        if (pro.completedUnitCount == 100) {
            doSome();
            [timer invalidate];
            timer = nil;
        }
    }];
    [t fire];
    return pro;
}

@end
