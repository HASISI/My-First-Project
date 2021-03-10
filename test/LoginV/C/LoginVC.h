//
//  LoginVC.h
//  test
//
//  Created by Mr.Ou on 2021/3/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LoginVDelegate <NSObject>

- (void)passName:(NSString *)name passPwd:(NSString *)pwd;

@end

@interface LoginVC : UIViewController

@property id <LoginVDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
