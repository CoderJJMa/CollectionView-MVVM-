//
//  InfoStreamFamilySectionModel.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamFamilySectionModel.h"
#import "InfoStreamFamilyItemModel.h"


Class rawDataClassWithLogicalType(InfoStreamFamilySectionLogicalType logicalType) {
    NSDictionary *dic = @{@(InfoStreamFamilySectionLogicalType_Header): @"InfoStreamSrcFamilyDatasModel", \
                          @(InfoStreamFamilySectionLogicalType_Role): @"SRgetRoleInfoStreamDatasFolkInfo", \
                          @(InfoStreamFamilySectionLogicalType_Message): @"SRgetRoleInfoStreamDatasBehavior", \
                          };
    NSString *strClass = [dic objectForKey:@(logicalType)];
    return NSClassFromString(strClass);
}


@implementation InfoStreamFamilySectionModel


- (void)setModelWithData:(id)model logicalType:(InfoStreamFamilySectionLogicalType)logicalType sectionStyle:(InfoStreamSectionStyle)sectionStyle {
    self.logicalType = logicalType;
    self.rawData = model;
    self.sectionStyle = sectionStyle;
    
    if (logicalType == InfoStreamFamilySectionLogicalType_Header) {
//        InfoStreamSrcFamilyDatasModel *rawData = (InfoStreamSrcFamilyDatasModel*)model;
//        self.title = @"360家庭防火墙";
//        self.subTitle = [NSString stringWithFormat:@"%d台防火墙正在守护您 的家人上网安全", (int)rawData.routerCount];
//        InfoStreamFamilyItemModel *item = [InfoStreamFamilyItemModel new];
//        item.infoStyle = InfoStreamItemStyleHeader;
//        item.title = self.title;
//        item.subtitle = self.subTitle;
//        self.infos = @[item];
        
    }else if (logicalType == InfoStreamFamilySectionLogicalType_Role) {
//        SRgetRoleInfoStreamDatasFolkInfo *folk = (SRgetRoleInfoStreamDatasFolkInfo*)model;
//        InfoStreamFamilyItemModel *item = [InfoStreamFamilyItemModel new];
//        item.infoStyle = InfoStreamItemStyleRole;
//        item.showIndicator = YES;
//        item.icon = folk.titleIcon;
//        item.title = folk.title;
//        item.subtitle = folk.subtitle;
//        item.desc = folk.desc;
//        item.descType = folk.descType;
//        self.infos = @[item];
        
    }else if (logicalType == InfoStreamFamilySectionLogicalType_Message) {
        RoleInfoStreamDatasBehavior *tinfo = (RoleInfoStreamDatasBehavior*)model;
        
        NSMutableArray *sections = [NSMutableArray array];
        
        //header
        if (sectionStyle == InfoStreamSectionStyleDefault
            || sectionStyle == InfoStreamSectionStyleContentAndHeader) {
            InfoStreamFamilyItemModel *item = [InfoStreamFamilyItemModel new];
            item.infoStyle = InfoStreamItemStyleSectionHeader;
            item.showIndicator = NO;
            item.title = @"今日上网动态";
            [sections addObject:item];
        }
        
        //content
        InfoStreamFamilyItemModel *item = [InfoStreamFamilyItemModel new];
        item.infoStyle = InfoStreamItemStyleMessage;
        item.showIndicator = YES;
        item.title = tinfo.title;
        item.icon = tinfo.icon;
        item.subtitle = tinfo.subtitle1;
        item.subTitle2 = tinfo.subtitle2;
        item.desc = tinfo.desc;
        [sections addObject:item];
        
        
        //footer
        if (sectionStyle == InfoStreamSectionStyleDefault
            || sectionStyle == InfoStreamSectionStyleContentAndFooter) {
            InfoStreamFamilyItemModel *item = [InfoStreamFamilyItemModel new];
            item.infoStyle = InfoStreamItemStyleSectionFooter;
            item.showIndicator = NO;
            item.title = @"查看详细报告 >";
            [sections addObject:item];
        }
        
        self.infos = sections;
        
    }else if (logicalType == InfoStreamFamilySectionLogicalType_BeginProtection
              || logicalType == InfoStreamFamilySectionLogicalType_BoundingWechat
              || logicalType == InfoStreamFamilySectionLogicalType_LightProtection
              || logicalType == InfoStreamFamilySectionLogicalType_Congratulation) {
        
        [self constructCustomModelWithType:logicalType];
    }
    
}

- (void)constructCustomModelWithType:(InfoStreamFamilySectionLogicalType)logicalType {
    InfoStreamFamilyItemModel *item = [InfoStreamFamilyItemModel new];
    if (logicalType == InfoStreamFamilySectionLogicalType_BeginProtection) {
        item.infoStyle = InfoStreamItemStyleWechat;
        item.showIndicator = YES;
        item.icon = @"sr_istm_icon_protection";
        item.title = @"开始守护";
        item.subtitle = @"为家人选择上网手机后即可开始守护家人的上网安全";
        item.subTitle2 = @"立即选择";
        
    }else if (logicalType == InfoStreamFamilySectionLogicalType_BoundingWechat) {
        item.infoStyle = InfoStreamItemStyleWechat;
        item.showIndicator = YES;
        item.icon = @"sr_istm_icon_wechat";
        item.title = @"绑定微信";
        item.subtitle = @"将随时通知家中儿童老人上网情况";
        item.subTitle2 = @"立即绑定";
        
    }else if (logicalType == InfoStreamFamilySectionLogicalType_LightProtection) {
        item.infoStyle = InfoStreamItemStyleWechat;
        item.showIndicator = YES;
        item.icon = @"sr_istm_icon_light";
        item.title = @"点亮守护计划";
        item.subtitle = @"守护千万家庭的儿童老人安全上网";
        item.subTitle2 = @"立即点亮";
        
    }else if (logicalType == InfoStreamFamilySectionLogicalType_Congratulation) {
        item.infoStyle = InfoStreamItemStyleCongratulation;
        item.icon = @"sr_istm_img_protection";
        item.title = @"恭喜您！";
        item.subtitle = @"已成功激活360家庭防火墙，成为第*位家庭守护神！从今天起，和我一起为家守护！";
    }
    self.infos = @[item];
}


@end




@implementation RoleInfoStreamDatasBehavior
@end
