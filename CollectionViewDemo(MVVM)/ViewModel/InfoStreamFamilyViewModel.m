//
//  InfoStreamFamilyViewModel.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamFamilyViewModel.h"
#import "Common.h"

@implementation InfoStreamFamilyViewModel

- (void)requestListWithRouter:(NSDictionary *)parmar{
    
    __weak typeof(self) weakSelf = self;
//    模拟数据
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSBundle * bunndle = [NSBundle mainBundle];
            NSString *path = [[bunndle resourcePath] stringByAppendingPathComponent:@"InfoStream.json"];
            NSData *jsonData = [NSData dataWithContentsOfFile:path];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:NULL];
            weakSelf.rawData = [RoleInfoStreamDatasModel yy_modelWithJSON:json];

            [weakSelf convertRawDataToDisplay];
    
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.delegate infoStreamModel:self listRequestSuccess:YES];
            });
        });
    
}

- (void)convertRawDataToDisplay {
    
    
    
}

@end
