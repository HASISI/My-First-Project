//
//  MADSingleClass.h
//  MADCore
//
//  Created by 魏修全 on 2018/2/24.
//  Copyright © 2018年 Chengming Lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MADEventModel;
@class WKWebView;
@class MADContext;


typedef id(^CustomerSplashView)(MADContext *context, NSInteger seconds,NSString *imageUrl,NSString *stageUrl);
typedef id(^CustomerLoadingView)(MADContext *context);

@interface MADSingleClass : NSObject

//#ifdef BURIALPOINT
@property (nonatomic,strong) NSString* enterfuncTime;
//#endif

@property (nonatomic, strong) id worker; //CSII MADP add

@property (nonatomic, strong) MADEventModel *app_info; //add

@property (nonatomic,copy)CustomerSplashView customerSplash;

@property (nonatomic,copy)CustomerLoadingView customerLoadingTop;
/**
 (这两个属性在worker里是控制是否注入xhook.js  true不注入 false注入)
 */
// 是否使用代理端口  默认NO
@property (nonatomic,assign) BOOL isUsePortService;
// web是否使用代理端口 默认NO
@property (nonatomic,assign) BOOL isUsePortService_web;

// 监听是否是web页面调用sd, 需要处理请求头参数
@property (nonatomic,assign) BOOL isWebPage;

/**
MADSingleClass实例
 */
+(instancetype) getInstance;

/**
 字典转json字符串
 @param dic 字典
 */
-(NSString*)dictionaryToJson:(NSDictionary *)dic;

/**
 json字符串转字典
 @param JSONString json串
 */
-(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;

/**
 对象转字典(key,value)
 @param entity 对象
 */
-(NSDictionary *) entityToDictionary:(id)entity;

/**
 按大小压缩image返回数据流
 @param image  image对象
 @param size   数据大小(byte)
 */
- (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;

/**
 创建二维码
 @param Content  二维码内容
 */
-(UIImage *)generateQRCode:(NSString *)Content;

/**
 创建二维码
 @param Content  二维码内容
 @param side     二维码边长
 */
-(UIImage *)generateQRCodeWithSide:(NSString *)Content :(int)side;

/**
 创建条形码
 @param str  条形码内容
 */
-(UIImage *)generateBarCodeWithStr:(NSString *)str;

/**
 创建条形码
 @param str  条形码内容
 @param width  条形码宽度
 @param height  条形码高度
 */
-(UIImage *)generateBarCodeWithStr:(NSString *)str :(int)width :(int)height;

/**
 获取设备IP地址
 @param preferIPv4  是否IPv4
 */
-(NSString *)getIPAddress:(BOOL)preferIPv4;

/**
返回image图片路径
 @param imgData  image数据流
 @param dictionaryName  images所在的文件夹名字可以传nil，weex有个缓存的问题，建议每个功能的图片放在不同的文件夹
 */
-(NSString *)getImageFilePathWithData:(NSData *)imgData inDictionary:(NSString *)dictionaryName;


//CSII MADP add
/**
 往请求头里放置AuthToken，供ServiceWorker鉴权
 */
-(void)setAuthTokenForHTTPHeaderField:(NSMutableURLRequest *)request;

/**
 往请求头里放置stage-type，供worker识别请求来自web or weex
 @param type  传web or weex
 */
-(void)setStageTypeForHTTPHeaderField:(NSMutableURLRequest *)request type:(NSString*)type;

/**
 定制WKWebView的User-Agent
 */
-(void)setCustomUserAgentForWKWebView:(WKWebView*)webview;

/**
 校验ServiceWorker起的代理服务器ssl证书信息（公钥和常用名称）
 */
-(BOOL)verifyServerCertInfoWithChallenge:(NSURLAuthenticationChallenge *)challenge;

//获取设备型号（系统API返回）
- (NSString*)getDeviceModel;
//获取设备型号名称 （手动翻译名称）
- (NSString *)getDeviceModelName;

/**
 获取当前时间
 @return 返回当前时间 格式：mm:ss
 */
- (NSString *)getCurrentTime;
/**
 获取开始时间和结束时间之差
 @return 返回时间差结果 单位：秒
 */
- (NSTimeInterval)pleaseInsertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime;
/**
 解压gif的data为图片数组
 */
-(UIImage *)decodeGifImageByData:(NSData *)data;
/**
 通过worker下载图片
*/
- (void)downLoadImg:(NSString *)urlStr type:(NSString *)type callBack:(void(^)(UIImage *img, NSInteger code))callBack;
/**
 通过worker下载资源
*/
- (void)downLoadResource:(NSMutableURLRequest *)request callBack:(void(^)(NSData *resBody,NSString *header,NSString *contentType, NSInteger code))callBack;
/**
 通过worker下载资源 wkwebview
*/
-(void)downLoadResource:(NSMutableURLRequest *)request withblock:(void(^)(id resp))callBack;

/**
 通过worker下载资源  回调在子线程
*/
- (void)asyncDownLoadResource:(NSMutableURLRequest *)request callBack:(void(^)(NSData *resBody,NSString *header,NSString *contentType, NSInteger code))callBack;
/**
 传入数组, 将数组中的元素拼接成string
*/
- (NSString *)stringWithArr:(NSArray *)arr;
@end

@interface MADEventModel : NSObject
@property (nonatomic , copy) NSString *client_id;
@property (nonatomic , copy) NSString *app_id;
@property (nonatomic , copy) NSString *app_secretkey;
@property (nonatomic , copy) NSString *behavior_url;

+(instancetype)instanceWithDict:(NSDictionary *)dict;
@end
