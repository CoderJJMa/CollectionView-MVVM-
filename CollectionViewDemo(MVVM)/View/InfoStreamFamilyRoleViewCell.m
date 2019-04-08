//
//  SRXInfoStreamFamilyRoleViewCell.m
//  SecurityRouterLib
//
//  Created by majianjie on 2019/4/3.
//  Copyright © 2019 360. All rights reserved.
//

#import "InfoStreamFamilyRoleViewCell.h"
#import "InfoStreamFamilyItemModel.h"

#define UIColorFromRGBA(c,a)        [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:a]

static CGFloat kTextMaginX = 14+12+12;

@interface InfoStreamFamilyRoleViewCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView *tipView;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIImageView *arrowImgView;
@property (nonatomic, strong)CAGradientLayer *coverLayer;

@end


@implementation InfoStreamFamilyRoleViewCell

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


- (void)installUI {
    
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.separatorHidden = YES;
    
    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.right.mas_equalTo(-14);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
    }];
    
    // 增加圆角和阴影
    self.bgView.layer.cornerRadius = 6.0f;
    self.bgView.layer.shadowColor = UIColorFromRGBA(0x959FBA, 1.0).CGColor;
    self.bgView.layer.shadowRadius = 6.0f;
    self.bgView.layer.shadowOpacity = 0.5;

    self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.iconView.layer.cornerRadius = 25.f;
    self.iconView.layer.masksToBounds = YES;
    self.iconView.image = [UIImage imageNamed:@"sr_report_app_icon_wb"];
    [self.bgView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"小宝的一天";
    self.nameLabel.textColor = UIColorFromRGB(0x383C4E);
    self.nameLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.bgView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(12);
        make.top.mas_equalTo(self.iconView.mas_top);
    }];
    
    self.timeLabel = [UILabel new];
    self.timeLabel.textColor = UIColorFromRGB(0x7A7E8E);
    self.timeLabel.text = @"上网总时长:4.3小时";
    self.timeLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.bgView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel.mas_left);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).mas_offset(4);
    }];
    
    self.arrowImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sr_istm_big_arrow"]];
    [self.bgView addSubview:self.arrowImgView];
    [self.arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(14);
    }];
    
    self.tipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.fl_width, 100)];
    self.tipView.layer.cornerRadius = 5.f;
    self.tipView.backgroundColor = [UIColor orangeColor];
    self.tipView.layer.masksToBounds = YES;
    [self.bgView addSubview:self.tipView];
    
    //oval
    UIImageView *ovalView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sr_info_stream_oval"]];
    [self.tipView addSubview:ovalView];
    [ovalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    CAGradientLayer *coverLayer = [CAGradientLayer layer];
    self.coverLayer = coverLayer;
    coverLayer.colors = @[(id)UIColorFromRGB(0xF64907).CGColor,(id)UIColorFromRGB(0xFB7F11).CGColor];
    coverLayer.frame = self.tipView.bounds;
    NSArray *locations = [NSArray arrayWithObjects:@(0.0), @(1.0), nil];
    coverLayer.locations = locations;
    coverLayer.startPoint = CGPointMake(0, 0.5);
    coverLayer.endPoint = CGPointMake(0.8, 0.5);
    [self.tipView.layer insertSublayer:coverLayer atIndex:0];
        
    self.tipLabel = [[UILabel alloc] init];
    self.tipLabel.textColor = UIColorFromRGB(0xFFFFFF);
    self.tipLabel.font = [UIFont boldSystemFontOfSize:14];
    self.tipLabel.numberOfLines = 0;
    self.tipLabel.text = @"小宝今天总共上网4个小时43分钟，已严重超时3小时32分钟，建议提醒小宝注意上网时长。";
    [self.tipView addSubview:self.tipLabel];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(12);
        make.bottom.mas_equalTo(-12);
    }];
    
    [self.tipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(90);
        make.left.mas_equalTo(12);
        make.bottom.mas_equalTo(-12);
        make.right.mas_equalTo(-12);
    }];
}


- (void)updateInfo:(InfoStreamItemModel *)info {
    [super updateInfo:info];
    InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
    self.nameLabel.text = model.title;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    self.timeLabel.text = model.subtitle;
    self.tipLabel.text = model.desc;
    
    NSDictionary *dic =  info.info;
    NSInteger timeType = [[dic objectForKey:@"timeType"] integerValue];
    if (timeType == 1) {//深夜
        self.coverLayer.colors = @[(id)UIColorFromRGB(0x658FF6).CGColor,(id)UIColorFromRGB(0x9FC2FB).CGColor];
    }else if (timeType ==2) {//安全
        self.coverLayer.colors = @[(id)UIColorFromRGB(0x2CD388).CGColor,(id)UIColorFromRGB(0x4CD570).CGColor];
    }else {
        self.coverLayer.colors = @[(id)UIColorFromRGB(0xF8723C).CGColor,(id)UIColorFromRGB(0xFC9D49).CGColor];
    }
}



+ (CGSize)sizeForItem:(InfoStreamItemModel *)info
{
    InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
    NSString *content = model.desc;

    int height = 0;
    CGRect rect = [content boundingRectWithSize:CGSizeMake(ScreenWidth - kTextMaginX*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]} context:nil];
    height += rect.size.height + 12*2; //红框高度
    height += 90 + 12; //圆角框高度
    return CGSizeMake(ScreenWidth, height+10*2);
}


@end
