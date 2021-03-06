//
//  InfoStreamFamilyViewModel.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamFamilyViewModel.h"
#import "Common.h"
#import "InfoStreamFamilySectionModel.h"
#import "RoleInfoStreamDatasModel.h"

//#define PublicConfig

@implementation InfoStreamFamilyViewModel

- (void)requestListWithRouter:(NSDictionary *)parmar{
    
//    __weak typeof(self) weakSelf = self;
#ifdef PublicConfig
    [self setFreshDisplayData];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.delegate infoStreamModel:self listRequestSuccess:YES];
    });
#else
    //    模拟数据
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSBundle * bunndle = [NSBundle mainBundle];
        NSString *filePath = [[bunndle resourcePath] stringByAppendingPathComponent:@"InfoStream.json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:NULL];
        self.rawData = [RoleInfoStreamDatasModel yy_modelWithJSON:json];
        
        [self convertRawDataToDisplay];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate infoStreamModel:self listRequestSuccess:YES];
        });
    });
#endif
    
}

- (void)convertRawDataToDisplay {
    
    NSMutableArray<InfoStreamFamilySectionModel*> *sections = [NSMutableArray new];
    
    //header
    {
        InfoStreamFamilySectionModel *sec = [InfoStreamFamilySectionModel new];
        [sec setModelWithData:_rawData.family logicalType:InfoStreamFamilySectionLogicalType_Header sectionStyle:InfoStreamSectionStyleContentOnly title:@"今日上网动态" isDate:NO];
        [sections addObject:sec];
    }
    
    
    for (RoleInfoStreamDatasFolkInfo *folk in _rawData.folks) {
        InfoStreamFamilySectionModel *sec = [InfoStreamFamilySectionModel new];
        [sec setModelWithData:folk logicalType:InfoStreamFamilySectionLogicalType_Role sectionStyle:InfoStreamSectionStyleContentOnly title:@"今日上网动态" isDate:NO];
        sec.familyId = folk.folkId;
        [sections addObject:sec];
        
        NSInteger index = 0;
        NSString *oldSectionTitle;

        if(folk.behavior.count == 0){
            InfoStreamFamilySectionModel *seci = [InfoStreamFamilySectionModel new];
            [seci setModelWithData:folk logicalType:InfoStreamFamilySectionLogicalType_NoData sectionStyle:InfoStreamSectionStyleContentOnly title:@"今日上网动态" isDate:NO];
            
            seci.familyId = sec.familyId;
            [sections addObject:seci];
            
        }else{
            
            for (RoleInfoStreamDatasBehavior *tb in folk.behavior) {
                
                BOOL hasSectionTitle = NO;
                NSString *sectionTitle = [NSString getDateTextWithTimeStamp:tb.time];
                if (!oldSectionTitle || ![oldSectionTitle isEqualToString:sectionTitle]) {
                    hasSectionTitle = YES;
                }
                oldSectionTitle = sectionTitle;
                
                BOOL isDate = YES;
                if ([sectionTitle isEqualToString:@"今日"]) {
                    isDate = NO;
                    sectionTitle = @"今日上网动态";
                }
                
                
                InfoStreamSectionStyle sectionStyle;
//                if (index == 0 && index == folk.behavior.count-1) {
//                    sectionStyle = InfoStreamSectionStyleDefault;
//                }else if (index == 0) {
//                    sectionStyle = InfoStreamSectionStyleContentAndHeader;
//                }else if (index == folk.behavior.count-1) {
//                    sectionStyle = InfoStreamSectionStyleContentAndFooter;
//                }else {
//                    sectionStyle = InfoStreamSectionStyleContentOnly;
//                }

                if (hasSectionTitle && index == folk.behavior.count-1) {
                    sectionStyle = InfoStreamSectionStyleDefault;
                }else if (hasSectionTitle) {
                    sectionStyle = InfoStreamSectionStyleContentAndHeader;
                }else if (index == folk.behavior.count-1) {
                    sectionStyle = InfoStreamSectionStyleContentAndFooter;
                }else {
                    sectionStyle = InfoStreamSectionStyleContentOnly;
                }
                
                InfoStreamFamilySectionModel *seci = [InfoStreamFamilySectionModel new];
                [seci setModelWithData:tb logicalType:InfoStreamFamilySectionLogicalType_Message sectionStyle:sectionStyle title:sectionTitle isDate:isDate];
                seci.familyId = sec.familyId;
                [sections addObject:seci];
                ++index;
            }
            
        }
       
    }
    self.infoCards = sections;
    
}

- (void)setFreshDisplayData {
    
    NSMutableArray<InfoStreamFamilySectionModel*> *sections = [NSMutableArray new];

    //header
    {
        InfoStreamFamilySectionModel *sec = [InfoStreamFamilySectionModel new];
        [sec setModelWithData:_rawData logicalType:InfoStreamFamilySectionLogicalType_Header sectionStyle:InfoStreamSectionStyleContentOnly title:@"今日上网动态" isDate:NO];
        [sections addObject:sec];
    }

    //开始守护
    {
        InfoStreamFamilySectionModel *sec = [InfoStreamFamilySectionModel new];
        [sec setModelWithData:nil logicalType:InfoStreamFamilySectionLogicalType_BeginProtection sectionStyle:InfoStreamSectionStyleContentOnly title:@"今日上网动态" isDate:NO];
        [sections addObject:sec];
    }

    //绑定微信
    {
        InfoStreamFamilySectionModel *sec = [InfoStreamFamilySectionModel new];
        [sec setModelWithData:nil logicalType:InfoStreamFamilySectionLogicalType_BoundingWechat sectionStyle:InfoStreamSectionStyleContentOnly title:@"今日上网动态" isDate:NO];
        [sections addObject:sec];
    }

    //点亮守护计划
    {
        InfoStreamFamilySectionModel *sec = [InfoStreamFamilySectionModel new];
        [sec setModelWithData:nil logicalType:InfoStreamFamilySectionLogicalType_LightProtection sectionStyle:InfoStreamSectionStyleContentOnly title:@"今日上网动态" isDate:NO];
        [sections addObject:sec];
    }

    //恭喜您
    {
        InfoStreamFamilySectionModel *sec = [InfoStreamFamilySectionModel new];
        [sec setModelWithData:nil logicalType:InfoStreamFamilySectionLogicalType_Congratulation sectionStyle:InfoStreamSectionStyleContentOnly title:@"今日上网动态" isDate:NO];
        [sections addObject:sec];
    }
    self.infoCards = sections;
}

- (InfoStreamFamilySectionModel*)sectionModelWithIndexPath:(NSIndexPath*)path {
    if (path.row >= self.infoCards.count) return nil;
    return (InfoStreamFamilySectionModel*)self.infoCards[path.section];
}

@end
