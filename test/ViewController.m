//
//  ViewController.m
//  test
//
//  Created by Mr.Ou on 2021/2/23.
//

#import "ViewController.h"
#import "TestService.h"
#import <YYModel.h>
#import "HomeModel.h"
#import "DataModel.h"
#import "MADCore.framework/Headers/MADCore.h"
#import "LoginVC.h"

@interface ViewController ()<LoginVDelegate> {
    MADContext *ctx;
}
@property (strong, nonatomic) NSConditionLock *lock;
@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) HomeModel *mo;
@end

@implementation ViewController

//- (id)initWithRouterParams:(NSDictionary *)params {
//    if (self = [self initWithNibName:nil bundle:nil]) {
//        self.title = @"oyj";
//        ctx = [params objectForContext];
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
//    [ctx next];
//    [self getData];
//    self.lock = [[NSConditionLock alloc] initWithCondition:1];
//    [[[NSThread alloc] initWithTarget:self selector:@selector(three) object:nil] start];
//    [[[NSThread alloc] initWithTarget:self selector:@selector(one1) object:nil] start];
//    [[[NSThread alloc] initWithTarget:self selector:@selector(two) object:nil] start];
    
    [self addOtherUI];
}

//按钮圆角化
- (void)addOtherUI {
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    _btn.center = self.view.center;
    [_btn setBackgroundColor:UIColor.blueColor];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:_btn.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(50, 50)];
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.frame = _btn.bounds;
    maskLayer.path = bezierPath.CGPath;
    _btn.layer.mask = maskLayer;
    [self.view addSubview:_btn];
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick {
    LoginVC *vc = [LoginVC new];
    vc.delegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark 线程锁
- (void)one1 {
    [self.lock lockWhenCondition:1];
    NSLog(@"one");
    [self.lock unlockWithCondition:3];
}

- (void)two {
    [self.lock lockWhenCondition:2];
    NSLog(@"two");
    [self.lock unlock];
}

- (void)three {
    [self.lock lockWhenCondition:3];
    NSLog(@"three");
    [self.lock unlockWithCondition:2];
}

#pragma mark 网络
- (void)getData {
    [[TestService shareManager] GetUrlStr:@"https://shopapp.gani.com.cn/Gani_shop_webapi/getShopBrandAdver" WithSuccessBlock:^(id _Nonnull dic) {
        NSLog(@"----------------------------------dic = %@----------------------------------",dic);
        self.mo = [HomeModel yy_modelWithJSON:dic];
        DataModel *d = self.mo.data[0];
        NSLog(@"%@",d.phone_url);
    } WithFailBlock:^(NSError * _Nonnull error) {
        NSLog(@"----------------------------------error = %@----------------------------------",error);
    }];
}

- (void)passName:(NSString *)name passPwd:(NSString *)pwd {
    NSLog(@"%@ ----- %@",name,pwd);
}

@end
