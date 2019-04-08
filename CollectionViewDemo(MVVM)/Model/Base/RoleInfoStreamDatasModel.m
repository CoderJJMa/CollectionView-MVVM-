//
//  RoleInfoStreamDatasModel.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "RoleInfoStreamDatasModel.h"



@implementation RoleInfoStreamDatasBehavior
@end


@implementation RoleInfoStreamDatasFolkInfo
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"folkId" : @"folk_id",
             @"roleIndex" : @"role",
             @"roleName" : @"name",
             @"titleIcon" : @"icon",
             @"descType" : @"type",
             @"behavior": @"event_list"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"behavior" :[RoleInfoStreamDatasBehavior class]
             };
}
@end


@implementation RoleInfoStreamDatasModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"family" : @"family",
             @"folks": @"folk_list"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"folks" :[RoleInfoStreamDatasFolkInfo class]
             };
}

@end

@implementation InfoStreamSrcFamilyDatasModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"routerCount" : @"router_cnt"
             };
}
@end
