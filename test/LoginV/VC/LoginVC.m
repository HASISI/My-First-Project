//
//  LoginVC.m
//  test
//
//  Created by Mr.Ou on 2021/3/8.
//

#import "LoginVC.h"

@interface LoginVC ()

@property (strong, nonatomic) UITextField *field1;
@property (strong, nonatomic) UITextField *field2;
@property (strong, nonatomic) UIButton *loginBtn;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UITextField *)field1 {
    if (!_field1) {
        
    }return _field1;
}

- (UITextField *)field2 {
    if (!_field2) {
        
    }return _field2;
}

@end
