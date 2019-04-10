//
//  InfoStreamFamilySectionModel.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamSectionModel.h"

NS_ASSUME_NONNULL_BEGIN
//决定了构建哪一个数据model，怎么解释数据
typedef NS_ENUM(NSInteger, InfoStreamFamilySectionLogicalType) {
    InfoStreamFamilySectionLogicalType_Header,//表头
    InfoStreamFamilySectionLogicalType_Role, //角色(小宝的一天)
    InfoStreamFamilySectionLogicalType_Message,//消息
    InfoStreamFamilySectionLogicalType_BeginProtection,  //开始守护
    InfoStreamFamilySectionLogicalType_BoundingWechat,  //绑定微信
    InfoStreamFamilySectionLogicalType_LightProtection,  //点亮守护
    InfoStreamFamilySectionLogicalType_Congratulation,  //恭喜您
    InfoStreamFamilySectionLogicalType_NoData,  //恭喜您
};

extern Class rawDataClassWithLogicalType(InfoStreamFamilySectionLogicalType logicalType);


@interface InfoStreamFamilySectionModel : InfoStreamSectionModel

@property(nonatomic, assign) NSInteger familyId;
@property(nonatomic, assign) InfoStreamFamilySectionLogicalType logicalType;
@property(nonatomic, strong) id rawData;


- (void)setModelWithData:(_Nullable id)model logicalType:(InfoStreamFamilySectionLogicalType)logicalType sectionStyle:(InfoStreamSectionStyle)sectionStyle title:(NSString*)title isDate:(BOOL)isDate;

@end

NS_ASSUME_NONNULL_END
