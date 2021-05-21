//
//  HomeCell.m
//  test
//
//  Created by Mr.Ou on 2021/5/18.
//

#import "HomeCell.h"

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }return self;
}

- (void)initView {
    _c_text = [[UITextField alloc] init];
    [self addSubview:_c_text];
    [_c_text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH(200), SCREEN_HEIGHT(50)));
    }];
    _c_text.textColor = [UIColor redColor];
    _c_text.layer.borderColor = UIColor.lightGrayColor.CGColor;
    _c_text.layer.borderWidth = 2;
    _c_text.textAlignment = NSTextAlignmentCenter;
    _c_text.font = [UIFont systemFontOfSize:30];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
