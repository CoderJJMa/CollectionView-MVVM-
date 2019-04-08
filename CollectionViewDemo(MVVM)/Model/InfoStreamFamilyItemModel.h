//
//  InfoStreamFamilyItemModel.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface InfoStreamFamilyItemModel : InfoStreamItemModel

@property (nonatomic, copy) NSString *strStatus;
@property (nonatomic, strong) NSString *iconStatus;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, assign) NSInteger descType;
@property (nonatomic , copy) NSString *desc_url;
@property (nonatomic , copy) NSString *subTitle2;


@end

NS_ASSUME_NONNULL_END
