//
//  InfoStreamCollectionViewCell.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

typedef void(^InfoStreamActionHandler)(InfoStreamActionType, _Nullable id);

typedef NS_ENUM(NSInteger, InfoStreamCellRoundedCornerType) {
    InfoStreamCellRoundedCornerTypeNone,
    InfoStreamCellRoundedCornerTypeTop,
    InfoStreamCellRoundedCornerTypeBottom,
    InfoStreamCellRoundedCornerTypeAll,
};

NS_ASSUME_NONNULL_BEGIN

@class InfoStreamItemModel;


@protocol InfoStreamCollectionViewCellProcotol <NSObject>
@optional
+ (CGSize)sizeForItem;
+ (CGSize)sizeForItem:(InfoStreamItemModel *)info;
@end



@interface InfoStreamBaseCollectionViewCell : UICollectionViewCell<InfoStreamCollectionViewCellProcotol>

@property (nonatomic, copy) InfoStreamActionHandler actionBlock;
@property (nonatomic, assign) UIEdgeInsets separatorInset;
@property (nonatomic, assign) BOOL separatorHidden;
@property (nonatomic, strong) InfoStreamItemModel *info;
@property (nonatomic, assign) InfoStreamCellRoundedCornerType cornerType;


- (void)updateInfo:(InfoStreamItemModel*)info;
+ (CGSize)sizeForItem;

@end

NS_ASSUME_NONNULL_END
