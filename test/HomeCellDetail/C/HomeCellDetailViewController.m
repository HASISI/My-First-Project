//
//  HomeCellDetailViewController.m
//  test
//
//  Created by Mr.Ou on 2021/5/20.
//

#import "HomeCellDetailViewController.h"
#import "HomeCellDetailView.h"

@interface HomeCellDetailViewController ()
@property (strong, nonatomic) HomeCellDetailView *v;
@end

@implementation HomeCellDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _v = [[HomeCellDetailView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self.view addSubview:_v];
}

@end
