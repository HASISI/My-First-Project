//
//  OYJTextField.m
//  test
//
//  Created by Mr.Ou on 2021/3/10.
//

#import "OYJTextField.h"

@implementation OYJTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self moreChange];
    }
    return self;
}

- (void)moreChange {
    self.textColor = [UIColor whiteColor];
    self.textAlignment = NSTextAlignmentCenter;
    self.font = [UIFont systemFontOfSize:20 weight:2];
    self.layer.cornerRadius = SCREEN_HEIGHT(15);
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor lightGrayColor];
}

@end
