//
//  InfoStreamSectionModel.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"
#import "InfoStreamItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface InfoStreamSectionModel : NSObject

@property (nonatomic, assign)InfoStreamSectionStyle sectionStyle;

@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *headerSubTitle;
@property (nonatomic, strong) NSString *footerTitle;
@property (nonatomic, strong) NSString *footerSubTitle;
@property (nonatomic, strong) NSArray<InfoStreamItemModel*> *infos;
@property (nonatomic, strong) id extension;

- (void)dataForTest;

- (void)manageModel;

@end

NS_ASSUME_NONNULL_END
