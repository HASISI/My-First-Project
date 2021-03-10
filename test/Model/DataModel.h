//
//  DataModel.h
//  test
//
//  Created by Mr.Ou on 2021/3/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataModel : NSObject
//@property (nonatomic, assign) UInt64 iid;
@property (nonatomic, copy) NSString *phone_url;
@property (nonatomic, assign)UInt64 sort;
@property (nonatomic, assign) UInt64 type;
@property (nonatomic, copy) NSString *update_url;
@end

NS_ASSUME_NONNULL_END
