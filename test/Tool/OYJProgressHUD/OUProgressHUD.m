//
//  OUProgressHUD.m
//  test
//
//  Created by Mr.Ou on 2021/3/10.
//

#import "OUProgressHUD.h"

static OUProgressHUD *instance;

@implementation OUProgressHUD

+ (instancetype)shareManager {
    instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (void)successHUD:(NSString *)message {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].windows.firstObject animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:1];
}

@end
