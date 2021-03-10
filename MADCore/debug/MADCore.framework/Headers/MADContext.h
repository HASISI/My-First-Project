//
//  MADContext.h
//  MADCore
//
//  Created by JustinLu on 9/14/17.
//  Copyright © 2017 Chengming Lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MADContext : NSObject {
    id rawContext;
}

@property (nonatomic, copy) NSData *(^decrtptionsCallBack)(NSData *p0);
@property (nonatomic, copy) NSData *(^encryptionsCallBack)(NSData *p0);

@property (nonatomic, strong) id rawContext;

- (id)initWithWorkerContext:(id)ctx;
- (void)next;
- (void)finish;
- (void)finishWithReturnValue:(NSString*)data;
- (NSString*)getReturnValue;
- (NSString*)extra;
- (NSString*)getParam:(NSString*)key;
- (void)launchStage:(NSString*)stageid;
- (void)replaceStage:(NSString*)stageid;
- (void)shutdown;
- (NSString*)secureGetString:(NSString*)key;
- (void)secureSetString:(NSString*)key value:(NSString*)value;
- (NSString*)sessionGetString:(NSString*)key;
- (void)sessionSetString:(NSString*)key value:(NSString*)value;
- (int)setToken:(NSString*)token;
- (void)clearToken;
- (int)checkToken;
- (NSString*)getTokenClaimString:(NSString*)key;
- (NSString*)getTimestamp;
- (void)setTimestamp:(NSString*)timestr;
- (NSString*)envGet:(NSString*)key;
- (int)handleQRCode:(NSString*)url;
- (NSString*)hashSHA256:(NSString*)plaintext;
- (NSString*)getMappedFileUrl:(NSString*)file;
- (NSString *)deviceSignature;
- (NSString*)getTokenClaimKeys;
- (long)refreshRepo:(NSString*)repoid;
- (long)refreshCentral;
- (long)isStageAvailable:(NSString*)stageid;
- (NSString*)getMappedUrl:(NSString*)path;
- (NSString*)getEnvKeys;
- (void)switchEnv:(NSString*)key;
- (NSString *)getRegistryString:(NSString*)key;
- (NSString*)proxyGetAddress;
- (NSString*)proxyGetHost;
- (long)proxyGetPort;
- (long)handleGray:(NSString*)userid;
- (long)registryCustomEncryption;
- (long)cancelCustomEncryption;
@end
