//
//  MADCore.h
//  MADCore
//
//  Created by JustinLu on 9/13/17.
//  Copyright © 2017 Chengming Lu. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for MADCore.
FOUNDATION_EXPORT double MADCoreVersionNumber;

//! Project version string for MADCore.
FOUNDATION_EXPORT const unsigned char MADCoreVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <MADCore/PublicHeader.h>

#import "MADEngine.h"
#import "MADContext.h"
#import "NSDictionary+MADCoreObjects.h"
//#ifdef WEBRENDER
#import "WebViewController.h"
//#endif
#import "MADSingleClass.h"
#import "MADBaseViewController.h"
//#ifdef WEEXRENDER
#import "WeexSDK.h"
#import "WeexViewController.h"
//#endif
//#ifdef BURIALPOINT
#import "Countly.h"
//#endif
