//
//  InfoStreamFamilyView.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamFamilyView.h"
#import "InfoStreamFamilyRoleViewCell.h"
#import "InfoStreamFamilyMessageCollectionCell.h"
#import "InfoStreamFamilySectionHeaderCell.h"
#import "InfoStreamFamilySectionFooterCell.h"
#import "InfoStreamFamilyHeaderCell.h"
#import "InfoStreamFamilyCongratulationCell.h"
#import "InfoStreamFamilyWechatCell.h"

#define kInfoStreamFamilyMargin 0

@interface InfoStreamFamilyView()
@property (nonatomic, strong)UIView *bgView;
@property (nonatomic, strong)UIView *bgTopView;
@end


@implementation InfoStreamFamilyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat headerWidth = ScreenWidth;
        
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        _bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.bgView];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        
        [self addSubview:self.bgTopView];
        [self.bgTopView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(-NavAndStatusHeight);
            make.width.mas_equalTo(headerWidth);
            make.height.mas_equalTo(headerWidth * 75 / 73);
        }];
        
        self.collectionView.showsVerticalScrollIndicator = NO;
        [self bringSubviewToFront:self.collectionView];
    }
    return self;
}


- (NSDictionary *)collectionViewCells
{
    return @{@(InfoStreamItemStyleRole): [InfoStreamFamilyRoleViewCell class],
             @(InfoStreamItemStyleMessage): [InfoStreamFamilyMessageCollectionCell class],
             @(InfoStreamItemStyleSectionHeader): [InfoStreamFamilySectionHeaderCell class],
             @(InfoStreamItemStyleSectionFooter): [InfoStreamFamilySectionFooterCell class],
             @(InfoStreamItemStyleHeader): [InfoStreamFamilyHeaderCell class],
             @(InfoStreamItemStyleCongratulation): [InfoStreamFamilyCongratulationCell class],// 恭喜
             @(InfoStreamItemStyleWechat): [InfoStreamFamilyWechatCell class],
             };
}

- (UIView*)bgTopView {
    if (!_bgTopView) {
        CGFloat headerWidth = ScreenWidth;
        _bgTopView = [[UIView alloc] initWithFrame:CGRectMake(0, -NavAndStatusHeight, headerWidth, 250)];
        _bgTopView.backgroundColor  = [UIColor clearColor];
        
        UIImageView *bgImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sr_homepage_header"]];
        bgImg.frame = CGRectMake(0, 0, headerWidth, headerWidth * 75 / 73);
        bgImg.contentMode = UIViewContentModeScaleAspectFill;
        [_bgTopView addSubview:bgImg];
        [bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
    }
    return _bgTopView;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, kInfoStreamFamilyMargin, kInfoStreamFamilyMargin, kInfoStreamFamilyMargin);
}


@end
