//
//  RoleInfoStreamDatasModel.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class InfoStreamSrcFamilyDatasModel,RoleInfoStreamDatasFolkInfo;
@interface RoleInfoStreamDatasModel : NSObject
@property (nonatomic, strong) InfoStreamSrcFamilyDatasModel *family;
@property (nonatomic , strong) NSArray   <RoleInfoStreamDatasFolkInfo *>   * folks;
+ (NSDictionary *)modelContainerPropertyGenericClass ;

@end

@interface RoleInfoStreamDatasBehavior :NSObject
@property (nonatomic , copy) NSString              * icon;
@property (nonatomic , copy) NSString              * title;//使用了QQ
@property (nonatomic , copy) NSString              * subtitle1;//2周前
@property (nonatomic , copy) NSString              * subtitle2;//来自一加手机4
@property (nonatomic , copy) NSString              * desc;
@property (nonatomic, assign) long long             time; //时间戳
@end

@interface RoleInfoStreamDatasFolkInfo :NSObject
@property (nonatomic , assign)NSInteger        folkId;//家人唯一id
@property (nonatomic , assign) NSInteger          roleIndex;
@property (nonatomic , copy) NSString              *roleName;
@property (nonatomic , copy) NSString              * title; //家人昵称
@property (nonatomic , copy) NSString              * titleIcon; //头像
@property (nonatomic , copy) NSString              * subtitle;
@property (nonatomic , copy) NSString              * desc;
@property (nonatomic , assign) NSInteger        descType;  // 0 1 2 3

@property (nonatomic , strong) NSArray<RoleInfoStreamDatasBehavior *>      * behavior;//行为
@end

NS_ASSUME_NONNULL_END
