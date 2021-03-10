//
//  MADBaseViewController.h
//  MADCore
//
//  Created by 魏修全 on 2019/4/20.
//

#import <UIKit/UIKit.h>
#import "MADContext.h"

/**
 appearstatus 页面显示状态
 */
typedef NS_ENUM(NSUInteger, AppearStatus) {
    WillAppear =0, //将要出现
    WillDisappear, //将要消失
    DidAppear,     //已经出现
    DidDisappear   //已经消失
};

@interface MADBaseViewController : UIViewController{
    MADContext *ctx;
}

typedef void (^ViewAppearBlock)(AppearStatus status);
@property(nonatomic,copy)ViewAppearBlock appearCallback;

@property (nonatomic, weak)UIImageView * placeholderImageView;
@property (nonatomic, copy)NSString * statusBarDarkFont;

@property (nonatomic, strong) MADContext *ctx;
@property (nonatomic, strong) NSURL *url;

- (void)setImagWithUrl:(NSString *)url imageV:(UIImageView *)imgV;
- (void)setImagWithUrl:(NSString *)url button:(UIButton *)btn;
@end

