//
//  InfoStreamViewModel.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoStreamProtocol.h"
#import "InfoStreamSectionModel.h"

NS_ASSUME_NONNULL_BEGIN
@class InfoStreamSectionModel;

@interface InfoStreamViewModel : NSObject

@property (nonatomic, strong) NSArray<InfoStreamSectionModel*> *infoCards;
@property (nonatomic, weak) id<InfoStreamProtocol> delegate;

- (void)requestListWithRouter:(NSDictionary *)parmar;

- (void)dataForTest;



@end

NS_ASSUME_NONNULL_END
