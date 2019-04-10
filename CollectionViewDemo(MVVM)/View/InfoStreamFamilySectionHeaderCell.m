//
//  SRXInfoStreamFamilyCollectionHeaderCell.m
//  SecurityRouterLib
//
//  Created by majianjie on 2019/4/3.
//  Copyright © 2019 360. All rights reserved.
// 

#import "InfoStreamFamilySectionHeaderCell.h"
#import "InfoStreamFamilyItemModel.h"


@interface InfoStreamFamilySectionHeaderCell()

@property (nonatomic,strong)UILabel *contentLabel;
@property (nonatomic, strong) UIView *line;

// 显示时间 "前天" "昨天" 等
@property (nonatomic, strong) UIImageView *statusImgView;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIView *statusView;

@end


@implementation InfoStreamFamilySectionHeaderCell

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
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.textColor = UIColorFromRGB(0x262934);
    self.contentLabel.font = [UIFont boldSystemFontOfSize:18];
    self.contentLabel.numberOfLines = 11;
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    
    self.line = [[UIView alloc] init];
    self.line.backgroundColor = UIColorFromRGB(0xF1F2F5);
    [self.contentView addSubview:self.line];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.left.mas_equalTo(74);
        make.right.mas_equalTo(0);
    }];
    
    
    
    //statusView--------------------->
    UIView *statusView = [[UIView alloc] init];
    self.statusView = statusView;
    self.statusView.hidden = YES;
    statusView.backgroundColor = UIColorFromRGB(0xEDEFF2);
    statusView.layer.cornerRadius = 11.f;
    statusView.layer.masksToBounds = YES;
    [self.contentView addSubview:statusView];
    [statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    self.statusImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sr_istm_icon_dot"]];
    [statusView addSubview:self.statusImgView];
    [self.statusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(3);
        make.top.mas_equalTo(4);
        make.bottom.mas_equalTo(-4);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(14);
    }];
    
    self.statusLabel = [UILabel new];
    self.statusLabel.textColor = UIColorFromRGB(0x1D202C);
    self.statusLabel.text = @"更早";
    self.statusLabel.font = [UIFont boldSystemFontOfSize:12];
    [statusView addSubview:self.statusLabel];
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.statusImgView.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(self.statusImgView.mas_centerY);
        make.right.mas_equalTo(-8);
    }];
    // <--------------------------

}

- (void)updateInfo:(InfoStreamItemModel *)info {
    InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
    self.contentLabel.text = model.title;
    
    if ([InfoStreamFamilySectionHeaderCell isDateWithModel:info]) {
        self.statusView.hidden = NO;
        self.contentLabel.hidden = YES;
        self.statusLabel.text = model.title;
        [self.statusImgView setImage:[UIImage imageNamed:model.icon]];
    }else {
        self.statusView.hidden = YES;
        self.contentLabel.hidden = NO;
        self.contentLabel.text = model.title;
    }

}

+ (CGSize)sizeForItem:(InfoStreamItemModel *)info
{
    InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
    NSString *content = model.desc;

    if ([self isDateWithModel:info]) {// 显示 昨天 前天 
        return CGSizeMake(ScreenWidth , 60);
    }
    
    int height = 80;
    CGRect rect = [content boundingRectWithSize:CGSizeMake(ScreenWidth , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]} context:nil];
    height += rect.size.height;
    return CGSizeMake(ScreenWidth , height);
}


+ (BOOL)isDateWithModel:(InfoStreamItemModel*)model{
    
    if ([model.info isKindOfClass:[NSDictionary class]]) {
        BOOL isDate = [[((NSDictionary*)model.info) objectForKey:@"isDate"] boolValue];
        return isDate;
    }
    return NO;
}


@end
