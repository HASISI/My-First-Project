//
//  LoginVC.m
//  test
//
//  Created by Mr.Ou on 2021/3/10.
//

#import "LoginVC.h"
#import "LoginV.h"


@interface LoginVC ()

@property (strong, nonatomic) LoginV *v;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
    [self addGesture];
}

- (void)addUI {
    _v = [[LoginV alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [_v initView];
    [self.view addSubview:_v];
    [_v.login_btn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    [self.view addGestureRecognizer:tap];
}

- (void)back {
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)login {
    if (_v.field1.text.length > 0 && _v.field2.text.length > 0) {
        NSLog(@"登录成功");
        if ([self.delegate respondsToSelector:@selector(passName:passPwd:)]) {
            [self.delegate passName:_v.field1.text passPwd:_v.field2.text];
        }
        _v.field1.text = @"";
        _v.field2.text = @"";
        [self.v endEditing:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = @"错误";
        [hud hideAnimated:YES afterDelay:1];
    }
}

@end
