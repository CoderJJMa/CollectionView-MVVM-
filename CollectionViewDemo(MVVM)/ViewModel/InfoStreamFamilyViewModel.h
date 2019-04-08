//
//  InfoStreamFamilyViewModel.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamViewModel.h"
#import "RoleInfoStreamDatasModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface InfoStreamFamilyViewModel : InfoStreamViewModel

// 服务器返回的真实的数据结构
@property(nonatomic, strong)RoleInfoStreamDatasModel *rawData;


@end

NS_ASSUME_NONNULL_END
