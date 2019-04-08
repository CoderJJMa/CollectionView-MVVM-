//
//  InfoStreamView.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

NS_ASSUME_NONNULL_BEGIN

@class InfoStreamView;
@class InfoStreamSectionModel;

@protocol InfoStreamViewDelegate <NSObject>
//点击item的事件
- (void)infoStreamView:(InfoStreamView *)detailView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
//点击section header或者footer等的事件
- (void)infoStreamView:(InfoStreamView *)detailView didSelectSectionOfActionType:(InfoStreamActionType)actionType andValue:(id)value atIndex:(NSIndexPath *)indexPath;
@optional
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end


@interface InfoStreamView : UIView

@property (nonatomic, weak) id<InfoStreamViewDelegate>delegate;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSArray<InfoStreamSectionModel*> *infoCards;//展示卡片的数组
@property (nonatomic, strong, readonly)UICollectionViewFlowLayout *flowLayout;

/**
 更新列表数据
 @param infos 卡片信息
 */
- (void)updateData:(NSArray*)infos;

- (void)reloadData;
/**
 刷新单个卡片
 
 @param index 卡片位置
 */
- (void)reloadSectionAtIndex:(NSInteger)index;

//需要子类覆写的方法
- (NSDictionary *)collectionViewCells;//所有cell样式的对应列表
- (void)registerCollectionCells;// 注册需要的cell
// 展示header和footer的view
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;
// 获取header的尺寸的方法(系统)
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
//获取footer的尺寸的方法(系统)
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;
// 展示item的方法(系统)
- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath;



@end

NS_ASSUME_NONNULL_END
