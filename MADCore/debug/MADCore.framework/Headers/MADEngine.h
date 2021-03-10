//
//  MADEngine.h
//  MADCore
//
//  Created by JustinLu on 9/13/17.
//  Copyright © 2017 Chengming Lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXLog.h"

@interface MADEngine : NSObject

typedef void (^MADEngineFunction)(NSDictionary *params);
typedef void (^InitEnvCallback)(void);

+ (void)registerModule:(NSString *)name withController:(Class)vc;
+ (void)registerModule:(NSString *)name withFunction:(MADEngineFunction)func;

/**
 初始化MADCore引擎
 @param callback callback用于应用层注册自己weexModule或weexComponent
 */
+ (void)initEnvironment:(InitEnvCallback)callback;

/**
 初始化MADCore引擎
 */
+ (void)initEnvironment;
/**
 初始化MADCore引擎
 @param level WeexSDK、MADCore、Worker共用日志级别，默认WXLogLevelWarning
 */
+ (void)initEnvironmentWithLogLevel:(WXLogLevel)level;
/**
初始化MADCore引擎
  @param level WeexSDK、MADCore、Worker共用日志级别，默认WXLogLevelWarning
  @param callback callback用于应用层注册自己weexModule或weexComponent
 */
+ (void)initEnvironmentWithLogLevel:(WXLogLevel)level callback:(InitEnvCallback)callback;
/**
 初始化MADCore引擎
 @param level WeexSDK、MADCore、Worker共用日志级别，默认WXLogLevelWarning
 @param proxy 代理地址
 @param callback callback用于应用层注册自己weexModule或weexComponent
 */
+ (void)initEnvironmentWithLogLevel:(WXLogLevel)level httpProxy:(NSString *)proxy callback:(InitEnvCallback)callback;
/**
 初始化MADCore引擎
 @param level WeexSDK、MADCore共用日志级别，默认WXLogLevelWarning
 @param workerLog Worker日志开关单独设置
 @param callback callback用于应用层注册自己weexModule或weexComponent
 */
+ (void)initEnvironmentWithLogLevel:(WXLogLevel)level workerLog:(BOOL)workerLog callback:(InitEnvCallback)callback;
/**
初始化MADCore引擎
@param level WeexSDK、MADCore共用日志级别，默认WXLogLevelWarning
@param isUse isUse 默认NO 走workerApi请求资源  YES 使用代理端口
@param callback callback用于应用层注册自己weexModule或weexComponent
*/
+ (void)initEnvironmentWithLogLevel:(WXLogLevel)level isUsePortService:(BOOL)isUse callback:(InitEnvCallback)callback;
/**
 初始化MADCore引擎
 @param level WeexSDK、MADCore共用日志级别，默认WXLogLevelWarning
 @param workerLog Worker日志开关单独设置
 @param proxy 代理地址
 @param callback callback用于应用层注册自己weexModule或weexComponent
 */
+ (void)initEnvironmentWithLogLevel:(WXLogLevel)level workerLog:(BOOL)workerLog httpProxy:(NSString *)proxy callback:(InitEnvCallback)callback;
/**
初始化MADCore引擎
@param level WeexSDK、MADCore共用日志级别，默认WXLogLevelWarning
@param workerLog Worker日志开关单独设置
@param proxy 代理地址
@param isUse isUse 默认NO 走workerApi请求资源  YES 使用代理端口
@param callback callback用于应用层注册自己weexModule或weexComponent
*/
+ (void)initEnvironmentWithLogLevel:(WXLogLevel)level workerLog:(BOOL)workerLog httpProxy:(NSString *)proxy isUsePortService:(BOOL)isUse callback:(InitEnvCallback)callback;

/**
 开启客户端埋点
 @param host 埋点日志发送的服务的地址
*/
+ (void)startBurialPointWithHost:(NSString *)host;

/**
邦盛行为分析，无此集成无需调用
 @param url 请求地址
 @param cust_id cust_id
 */
+ (void)initCQBConfig:(NSString *)url :(NSString *)cust_id;

+ (void)setNavigationController:(id)navigationcontroller;
+ (id)getNavigationController;
+ (id)getRootViewController;
+ (void)startup;
+ (void)launchStage:(NSString*)stageid;
+ (long)refreshRepo:(NSString*)repoid;
+ (long)refreshCentral;

//持久化存储（文件存储）
+ (void)secureSetString:(NSString*)key value:(NSString*)value;
+ (NSString*)secureGetString:(NSString*)key;

//内存中存储（程序退出会释放）
+ (void)sessionSetString:(NSString*)key value:(NSString*)value;
+ (NSString*)sessionGetString:(NSString*)key;
@end
