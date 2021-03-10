//
//  HomeModel.m
//  test
//
//  Created by Mr.Ou on 2021/3/4.
//

#import "HomeModel.h"
#import "DataModel.h"

@implementation HomeModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"msg" : @"msg",
             @"status" : @"status",
             @"data" : [DataModel class]};
}
@end
