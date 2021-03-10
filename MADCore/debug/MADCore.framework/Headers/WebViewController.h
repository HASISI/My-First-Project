//
//  WebViewController.h
//  MADCore
//
//  Created by Chengming Lu on 10/11/2017.
//  Copyright © 2017 Chengming Lu. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "MADBaseViewController.h"

@interface WebViewController : MADBaseViewController <WKUIDelegate, WKNavigationDelegate>{
    WKWebView *webview;
}

@property (nonatomic, strong) WKWebView *webview;

@end
