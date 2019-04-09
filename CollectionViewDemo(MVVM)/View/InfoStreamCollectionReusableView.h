//
//  InfoStreamCollectionHeaderView.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

typedef void(^InfoStreamActionHandler)(InfoStreamActionType, _Nullable id);


NS_ASSUME_NONNULL_BEGIN
@class InfoStreamSectionModel;
@interface InfoStreamCollectionReusableViewHeader : UICollectionReusableView

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, copy)InfoStreamActionHandler actionBlock;

- (void)updateHeaderInfo:(InfoStreamSectionModel *)cardInfo;


@end


@interface InfoStreamCollectionReusableViewFooter : UICollectionReusableView

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, copy)InfoStreamActionHandler actionBlock;

- (void)updateHeaderInfo:(InfoStreamSectionModel *)cardInfo;


@end

NS_ASSUME_NONNULL_END
