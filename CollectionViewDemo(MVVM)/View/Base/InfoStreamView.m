//
//  InfoStreamView.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamView.h"
#import "InfoStreamRefreshHeader.h"
#import "InfoStreamSectionModel.h"
#import "InfoStreamCollectionViewCell.h"
#import "InfoStreamCollectionHeaderView.h"

static NSString *kInfoStreamCollectionViewCell = @"InfoStreamCollectionViewCell";
static NSString *kInfoStreamCollectionHeaderView = @"InfoStreamCollectionHeaderView";
static NSString *kInfoStreamCollectionFooterView = @"InfoStreamCollectionFooterView";


@interface InfoStreamView()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) InfoStreamRefreshHeader * headerRefreshView;
@property (nonatomic,strong) MJRefreshAutoNormalFooter * footerRefreshView;


@end



@implementation InfoStreamView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        self.collectionView.backgroundColor = [UIColor clearColor];
        self.collectionView.delegate = self;
        self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);
        self.collectionView.dataSource = self;
        [self addSubview:self.collectionView];
        
        [self addRefreshView];
        [self registerCollectionCells];
    }
    return self;
}

- (void)addRefreshView {
    
    _headerRefreshView = [InfoStreamRefreshHeader headerWithRefreshingBlock:^{
    
        [self onRefreshHeader];
    }];
    self.collectionView.mj_header = _headerRefreshView;

//    _footerRefreshView = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(onLoadMore)];
//    _footerRefreshView.stateLabel.font = [UIFont systemFontOfSize:13];
//    _footerRefreshView.stateLabel.textColor = [UIColor lightGrayColor];
//    [_footerRefreshView setTitle:@"There'sNoMoreMessages" forState:MJRefreshStateNoMoreData];
//    self.collectionView.mj_footer = _footerRefreshView;
}

- (UICollectionViewFlowLayout *)flowLayout
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0.f;
    flowLayout.minimumInteritemSpacing = 0.f;
    return flowLayout;
}

- (NSDictionary *)collectionViewCells
{
    return nil;
}


- (void)registerCollectionCells
{
    [self.collectionView registerClass:[InfoStreamCollectionViewCell class] forCellWithReuseIdentifier:@"InfoStreamCollectionViewCell"];
    [self.collectionView registerClass:[InfoStreamCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kInfoStreamCollectionHeaderView"];
//    [self.collectionView registerClass:[InfoStreamCollectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"kInfoStreamCollectionFooterView"];
    
    for (Class class in self.collectionViewCells.allValues) {
        [self.collectionView registerClass:class forCellWithReuseIdentifier:NSStringFromClass(class)];
    }
}

- (void)scrollToTop
{
    UIEdgeInsets edgeInsets = self.collectionView.contentInset;
    [self.collectionView setContentOffset:CGPointMake(0, -edgeInsets.top)];
}
- (void)updateData:(NSArray *)infos
{
    self.infoCards = infos;
    [self.collectionView reloadData];
}

- (void)reloadData
{
    [self.collectionView reloadData];
}

- (void)reloadSectionAtIndex:(NSInteger)index
{
    if (index != NSNotFound && self.infoCards.count> index) {
        [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:index]];
    }
}

- (void)onRefreshHeader {
    [self.headerRefreshView endRefreshing];
}

- (void)onLoadMore {
    if(self.infoCards.count > 0) {
        self.footerRefreshView.hidden = NO;
    } else {
        self.footerRefreshView.hidden = YES;
    }
    
    if(NO) {
        [self.footerRefreshView endRefreshing];
    }else {
        [self.footerRefreshView endRefreshingWithNoMoreData];
    }
}


- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    InfoStreamSectionModel *section = self.infoCards[indexPath.section];
    InfoStreamItemModel *info = section.infos[indexPath.row];
    Class class = [self.collectionViewCells objectForKey:@(info.infoStyle)];
    if (!class) {
        class = [InfoStreamCollectionViewCell class];
    }
    InfoStreamCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(class) forIndexPath:indexPath];

    __weak typeof(self) weakSelf = self;
//    cell.actionBlock = ^(InfoStreamActionType actionType, id value) {
//        if ([weakSelf.delegate respondsToSelector:@selector(infoStreamView:didSelectSectionOfActionType:andValue:atIndex:)]) {
//            [weakSelf.delegate infoStreamView:weakSelf didSelectSectionOfActionType:actionType andValue:value atIndex:indexPath];
//        }
//    };

//    cell.cornerType = InfoStreamCellRoundedCornerTypeNone;

    [cell updateInfo:info];

    [cell setNeedsLayout];
    return cell;

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kInfoStreamCollectionHeaderView forIndexPath:indexPath];;
    }
    else if([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kInfoStreamCollectionFooterView forIndexPath:indexPath];;
    }
    return [UICollectionReusableView new];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    InfoStreamSectionModel *card = self.infoCards[section];
    return card.infos.count;

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.infoCards.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(infoStreamView:didSelectItemAtIndexPath:)]) {
        [self.delegate infoStreamView:self didSelectItemAtIndexPath:indexPath];
    }
}

// 拿到每一个item, 取里面的sizeForItem返回的结果
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    InfoStreamSectionModel *card = self.infoCards[indexPath.section];
    InfoStreamItemModel *info = card.infos[indexPath.row];
    Class class = [self.collectionViewCells objectForKey:@(info.infoStyle)];
    if (!class) {
        class = [InfoStreamCollectionViewCell class];
    }
    if ([class respondsToSelector:@selector(sizeForItem:)]) {
        return [class sizeForItem: info];
    }
    return[class sizeForItem];

}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.delegate scrollViewDidScroll:scrollView];
    }
}

@end
