//
//  InfoStreamCollectionViewCell.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamBaseCollectionViewCell.h"
#import "Common.h"
#import "InfoStreamItemModel.h"

@interface InfoStreamBaseCollectionViewCell()

@property (nonatomic, strong) UIView* topLine;


@end

@implementation InfoStreamBaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.zPosition = 1;
        self.topLine = [UIView new];
        self.topLine.backgroundColor = UIColorFromRGB(0xFBFBFB);
        [self.contentView addSubview:self.topLine];
        self.contentView.backgroundColor = [UIColor whiteColor];
        _separatorInset = UIEdgeInsetsMake(0, kInfoStreamMargin, 0, kInfoStreamMargin);
    }
    return self;
}

- (void)setSeparatorHidden:(BOOL)separatorHidden
{
    _separatorHidden = separatorHidden;
    self.topLine.hidden = separatorHidden;
}

- (void)setSeparatorInset:(UIEdgeInsets)separatorInset
{
    _separatorInset = separatorInset;
    self.topLine.frame = CGRectMake(separatorInset.left, 0, self.frame.size.width - separatorInset.left - separatorInset.right, 1);
}

- (void)updateInfo:(InfoStreamItemModel *)info
{
    self.info = info;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 0;
    self.layer.shadowColor = [UIColor whiteColor].CGColor;
}

+ (CGSize)sizeForItem{
    return CGSizeMake(ScreenWidth - kInfoStreamMargin * 2, 50);
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.topLine.frame = CGRectMake(_separatorInset.left, 0, self.frame.size.width - _separatorInset.left - _separatorInset.right, 1);
    self.topLine.hidden = _separatorHidden;
    self.contentView.fl_height = self.fl_height + 1;
    
    switch (_cornerType) {
        case InfoStreamCellRoundedCornerTypeAll:
            [self addRoundedCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(6, 6)] ;
            break;
        case InfoStreamCellRoundedCornerTypeTop:
            [self addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(6, 6)];
            break;
        case InfoStreamCellRoundedCornerTypeBottom:
            [self addRoundedCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(6, 6)];
            break;
        case InfoStreamCellRoundedCornerTypeNone:
            [self addRoundedCorners:UIRectCornerAllCorners cornerRadii:CGSizeZero];
            break;
    }
}

- (void)addRoundedCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
{
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.contentView.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.contentView.layer.mask = shape;
}
@end
