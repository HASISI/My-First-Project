//
//  HomeV.m
//  test
//
//  Created by Mr.Ou on 2021/4/2.
//

#import "HomeV.h"

@implementation HomeV 

- (void)initView {
    self.backgroundColor = UIColor.orangeColor;
    [self addSubview:self.table];
}

- (UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:self.bounds];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    }return _table;
}

@end
