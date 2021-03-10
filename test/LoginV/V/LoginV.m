//
//  LoginV.m
//  test
//
//  Created by Mr.Ou on 2021/3/10.
//

#import "LoginV.h"

@implementation LoginV

- (void)initView {
    self.backgroundColor = [UIColor whiteColor];
    
    _field1 = [[OYJTextField alloc] initWithFrame:CGRectMake(SCREEN_WIDTH(120), OKSrceenH/2-SCREEN_HEIGHT(30), OKScreenW-SCREEN_WIDTH(240), SCREEN_HEIGHT(30))];
    [self addSubview:_field1];
    _field2 = [[OYJTextField alloc] initWithFrame:CGRectMake(SCREEN_WIDTH(120), OKSrceenH/2+SCREEN_HEIGHT(30), OKScreenW-SCREEN_WIDTH(240), SCREEN_HEIGHT(30))];
    [self addSubview:_field2];
    
    _login_btn = [UIButton new];
    [self addSubview:_login_btn];
    [_login_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_field2.mas_bottom).with.mas_offset(SCREEN_HEIGHT(20));
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH(100), SCREEN_WIDTH(30)));
    }];
    [_login_btn setBackgroundColor:UIColor.grayColor];
    _login_btn.layer.cornerRadius = SCREEN_WIDTH(15);
    _login_btn.layer.masksToBounds = YES;
    [_login_btn setTitle:@"Login" forState:UIControlStateNormal];
    [_login_btn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}

@end
