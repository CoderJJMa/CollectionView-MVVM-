//
//  MyCollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by majianjie on 2019/3/10.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamFamilyMessageCollectionCell.h"
#import "InfoStreamFamilyItemModel.h"


#define kScreenWidth  [UIApplication sharedApplication].keyWindow.bounds.size.width

@interface InfoStreamFamilyMessageCollectionCell()

@property (nonatomic, strong)NSArray *data;

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *tipLabel;

@property (nonatomic, strong) UIView *line;


@end

@implementation InfoStreamFamilyMessageCollectionCell


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
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.iconView.layer.cornerRadius = 8.f;
    self.iconView.layer.masksToBounds = YES;
    self.iconView.image = [UIImage imageNamed:@"sr_report_app_icon_wb"];
    [self.contentView addSubview:self.iconView];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"正在使用微信聊天";
    self.nameLabel.textColor = UIColorFromRGB(0x596C95);
    self.nameLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.contentView addSubview:self.nameLabel];
    
    self.timeLabel = [UILabel new];
    self.timeLabel.textColor = UIColorFromRGB(0x7A7E8E);
    self.timeLabel.text = @"3分钟前 来自iPhone XS";
    self.timeLabel.font = [UIFont boldSystemFontOfSize:12];
    [self.contentView addSubview:self.timeLabel];
    
    
    self.tipLabel = [[UILabel alloc] init];
    self.tipLabel.textColor = UIColorFromRGB(0x4A4E5E);
    self.tipLabel.font = [UIFont boldSystemFontOfSize:16];
    self.tipLabel.numberOfLines = 0;
    [self.contentView addSubview:self.tipLabel];
    
    self.line = [[UIView alloc] init];
    self.line.backgroundColor = UIColorFromRGB(0xF1F2F5);
    [self.contentView addSubview:self.line];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(16);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(12);
        make.top.mas_equalTo(self.iconView.mas_top);
    }];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(74);
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(78);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel.mas_left);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).mas_offset(8);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.left.mas_equalTo(74);
        make.right.mas_equalTo(0);
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

//    self.iconView.fl_left = 12;
//    self.iconView.fl_top = 16;
//
//    self.nameLabel.fl_left = self.iconView.fl_width + self.iconView.fl_left + 12;
//    self.nameLabel.fl_top = self.iconView.fl_top;
//    [self.nameLabel sizeToFit];
    
//    self.timeLabel.fl_left = self.iconView.fl_width + self.iconView.fl_left + 12;
//    self.timeLabel.fl_top = self.nameLabel.fl_top + self.nameLabel.fl_height + 4;
//    [self.timeLabel sizeToFit];
}



- (void)updateInfo:(InfoStreamItemModel *)info {
    InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
    self.nameLabel.text = model.title;

    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    
    NSString *subTitle = @"";
    if (model.subtitle.length>0) {
        subTitle = model.subtitle;
    }
    if (model.subTitle2.length>0) {
        if (subTitle.length > 0) {
            subTitle = [subTitle stringByAppendingString:@"  "];
        }
        subTitle = [subTitle stringByAppendingString:model.subTitle2];
    }
    self.timeLabel.text = subTitle;
    
    self.tipLabel.text = model.desc;
}



+ (CGSize)sizeForItem:(InfoStreamItemModel *)info
{
    InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
    NSString *content = model.desc;
    
    int height = 110;
    CGRect rect = [content boundingRectWithSize:CGSizeMake(ScreenWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]} context:nil];
    height += rect.size.height;
    return CGSizeMake(ScreenWidth, height);
}

@end
