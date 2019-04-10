//
//  Common.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//


#import <UIKit/UIKit.h>

//! Project version number for Common.
FOUNDATION_EXPORT double CommonVersionNumber;

//! Project version string for Common.
FOUNDATION_EXPORT const unsigned char CommonVersionString[];

#import <Masonry/Masonry.h>
#import <YYModel/YYModel.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "MBProgressHUD.h"
#import "UIView+FLKit.h"

#define UIColorFromRGB(c)   [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]
#define UIColorFromRGBA(c,a)        [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:a]


#define ScreenWidth                 [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                [[UIScreen mainScreen] bounds].size.height
#define NavigationBarHeight       44.0f
#define TabBarHeight              49.0f
#define StatusBarHeight           ((CGSizeEqualToSize(CGSizeMake(375.0f, 812.0f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(414.0f, 896.0f), [UIScreen mainScreen].bounds.size)) ? 44.0f : 20.0f)  // 增加iPhoneX适配
#define NavAndStatusHeight        (NavigationBarHeight + StatusBarHeight)

#define kInfoStreamMargin (14.0)
#define kInfoStreamMargin (14.0)


typedef NS_ENUM(NSInteger, InfoStreamActionType) {
    InfoStreamActionTypeHeader,
    InfoStreamActionTypeFooter,
    InfoStreamActionTypeItemRightArrow
};


typedef NS_ENUM(NSInteger, InfoStreamSectionStyle) {
    InfoStreamSectionStyleDefault,//有头有尾
    InfoStreamSectionStyleContentAndHeader,
    InfoStreamSectionStyleContentAndFooter,
    InfoStreamSectionStyleContentOnly,
};


//决定了cell的展示样式
typedef NS_ENUM(NSInteger, InfoStreamItemStyle) {
    InfoStreamItemStyleDefault,
    InfoStreamItemStyleMore,
    InfoStreamItemStyleSwitch,
    InfoStreamItemStyleRole,
    InfoStreamItemStyleMessage,
    InfoStreamItemStyleHeader,
    InfoStreamItemStyleSectionHeader,
    InfoStreamItemStyleSectionFooter,
    InfoStreamItemStyleWechat, //开启守护，绑定微信，点亮守护计划共用该cell
    InfoStreamItemStyleCongratulation,//恭喜您样式
    InfoStreamItemStyleNoData,  //没有数据
};
