//
//  InfoStreamFamilyHeaderCell.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/9.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamFamilyHeaderCell.h"
#import "InfoStreamFamilyItemModel.h"
#import "Common.h"

@interface InfoStreamFamilyHeaderCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIImageView *icon;


@end

@implementation InfoStreamFamilyHeaderCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self installUI];
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        [self installUI];
    }
    return self;
}

- (void)installUI{
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.separatorHidden = YES;
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"360 家庭防火墙";
    _titleLabel.font = [UIFont boldSystemFontOfSize:24];
    _titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:_titleLabel];
    [_titleLabel sizeToFit];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(StatusBarHeight + 10);
        make.left.mas_equalTo(20);
    }];
    
    self.icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sr_info_stream_router_icon"]];
    [self addSubview:self.icon];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(8);
    }];
    
    _detailLabel = [[UILabel alloc] init];
    _detailLabel.text = @"2台防火墙正在守护您的家人上网安全";
    _detailLabel.font =  [UIFont boldSystemFontOfSize:12];
    _detailLabel.textColor = [UIColor whiteColor];
    [self addSubview:_detailLabel];
    [_detailLabel sizeToFit];
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(8);
        make.left.mas_equalTo(self.icon.mas_right).mas_offset(5);
    }];
}

- (void)updateInfo:(InfoStreamItemModel *)info {
    InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
    self.titleLabel.text = model.title;
    self.detailLabel.text = model.subtitle;
}

+ (CGSize)sizeForItem:(InfoStreamItemModel *)info
{
        InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
        NSString *content = model.subTitle2;
    
        int height = 140;
        CGRect rect = [content boundingRectWithSize:CGSizeMake(ScreenWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]} context:nil];
        height += rect.size.height;
        return CGSizeMake(ScreenWidth, height);
}


@end
