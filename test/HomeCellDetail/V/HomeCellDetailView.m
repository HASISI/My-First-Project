//
//  HomeCellDetailView.m
//  test
//
//  Created by Mr.Ou on 2021/5/20.
//

#import "HomeCellDetailView.h"

@implementation HomeCellDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditing:)];
    [self addGestureRecognizer:tap];
    
    self.backgroundColor = [UIColor lightGrayColor];
    
    _text = [[OYJTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH(200), SCREEN_HEIGHT(80))];
    _text.center = CGPointMake(OKScreenW/2, OKSrceenH/2);
    [self addSubview:_text];
    
    _lab = [UILabel new];
    [self addSubview:_lab];
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_text.mas_bottom).with.mas_offset(50);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(200, 80));
    }];
    _lab.textColor = [UIColor redColor];
    _lab.font = [UIFont systemFontOfSize:30];
    
    [_text addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textChange:(OYJTextField *)field {
    _lab.text = _text.text;
}

 
@end
