//
//  LoginV.h
//  test
//
//  Created by Mr.Ou on 2021/3/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginV : UIView

@property (strong, nonatomic) OYJTextField *field1;
@property (strong, nonatomic) OYJTextField *field2;
@property (strong, nonatomic) UIButton *login_btn;
- (void)initView;

@end

NS_ASSUME_NONNULL_END
