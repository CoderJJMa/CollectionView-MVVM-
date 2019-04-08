//
//  InfoStreamItemModel.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

NS_ASSUME_NONNULL_BEGIN

@interface InfoStreamItemModel : NSObject

@property (nonatomic, assign) InfoStreamItemStyle infoStyle;
@property (nonatomic, assign) BOOL showIndicator;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, copy) NSAttributedString *attributedTips;

@property (nonatomic, strong) id info;

@end

NS_ASSUME_NONNULL_END
