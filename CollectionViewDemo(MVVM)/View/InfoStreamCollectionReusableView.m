//
//  InfoStreamCollectionHeaderView.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamCollectionReusableView.h"


@implementation InfoStreamCollectionReusableViewHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView = [[UIView alloc] init];
        self.contentView.frame = CGRectMake(kInfoStreamMargin, 0, self.fl_width - 2 * kInfoStreamMargin, self.fl_height);
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.contentView];
        self.layer.zPosition = 1;
        
        UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.contentView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(6, 6)];
        CAShapeLayer* shape = [[CAShapeLayer alloc] init];
        [shape setPath:rounded.CGPath];
        self.contentView.layer.mask = shape;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self.contentView addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapAction:(id)sender
{
    if (self.actionBlock) {
        self.actionBlock(InfoStreamActionTypeHeader,nil);
    }
}

- (void)updateHeaderInfo:(InfoStreamSectionModel *)cardInfo
{
    
}

@end







@implementation InfoStreamCollectionReusableViewFooter

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView = [[UIView alloc] init];
        self.contentView.frame = CGRectMake(kInfoStreamMargin, 0, self.fl_width - 2 * kInfoStreamMargin, self.fl_height);
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.contentView];
        self.layer.zPosition = 1;
        
        UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.contentView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(6, 6)];
        CAShapeLayer* shape = [[CAShapeLayer alloc] init];
        [shape setPath:rounded.CGPath];
        self.contentView.layer.mask = shape;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self.contentView addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapAction:(id)sender
{
    if (self.actionBlock) {
        self.actionBlock(InfoStreamActionTypeFooter,nil);
    }
}

- (void)updateHeaderInfo:(InfoStreamSectionModel *)cardInfo
{
    
}

@end
