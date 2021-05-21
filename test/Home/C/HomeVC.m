//
//  HomeVC.m
//  test
//
//  Created by Mr.Ou on 2021/4/2.
//

#import "HomeVC.h"
#import "HomeV.h"
#import "HomeCell.h"
#import "HomeCellDetailViewController.h"

@interface HomeVC () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) HomeV *hV;
@property (strong, nonatomic) UIViewController *vc1;
@property (strong, nonatomic) UIViewController *vc2;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addUI];
}

- (void)addUI {
    self.hV = [[HomeV alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.hV.table.delegate = self;
    self.hV.table.dataSource = self;
    [self.hV.table registerClass:[HomeCell class] forCellReuseIdentifier:@"h_cell"];
    [self.hV initView];
    [self.view addSubview:self.hV];
}

- (void)setHomeData:(NSArray *)homeData {
    _homeData = homeData;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"h_cell" forIndexPath:indexPath];
    cell.c_text.text = _homeData[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _homeData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SCREEN_HEIGHT(80);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[HomeCellDetailViewController new] animated:YES];
}

@end
