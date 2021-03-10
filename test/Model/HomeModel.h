//
//  HomeModel.h
//  test
//
//  Created by Mr.Ou on 2021/3/4.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeModel : NSObject<YYModel>

@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) UInt64 status;
@property (nonatomic, strong) NSArray *data;
@end


NS_ASSUME_NONNULL_END
