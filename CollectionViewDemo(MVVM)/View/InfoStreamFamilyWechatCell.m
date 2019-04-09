//
//  InfoStreamFamilyWechatCell.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/9.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamFamilyWechatCell.h"
#import "Common.h"
#import "InfoStreamFamilyItemModel.h"

static CGFloat const kMarginX = 10;
static CGFloat const kTextMarginRight = 15;

@interface InfoStreamFamilyWechatCell()

@property(nonatomic, strong)UIView *backView;
@property(nonatomic, strong)UIView *shadowView;
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UILabel *descLabel;
@property(nonatomic, strong)UIImageView *iconView;
@property(nonatomic, strong)UIImageView *arrowView;
@property(nonatomic, strong)UIView *lineView;
@property(nonatomic, strong)UILabel *goLabel;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation InfoStreamFamilyWechatCell

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
    
    [self.contentView addSubview:self.shadowView];
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(5, kMarginX, 5, kMarginX));
    }];
    
    [self.shadowView addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.shadowView);
    }];
    
    [self.backView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.top.mas_equalTo(20);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    [self.backView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(10);
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
    }];
    
    [self.backView addSubview:self.descLabel];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
        make.right.mas_equalTo(-kTextMarginRight);
    }];
    
    
    [self.backView addSubview:self.arrowView];
    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
        make.width.mas_equalTo(6);
        make.height.mas_equalTo(10);
    }];
    
    [self.backView addSubview:self.goLabel];
    [self.goLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.iconView.mas_centerY);
        make.right.mas_equalTo(self.arrowView.mas_left).mas_offset(-2);
    }];
    
}


#pragma mark - Getter/Setter
- (UIView*)backView {
    if (!_backView) {
        _backView = [UIView new];
        _backView.backgroundColor = UIColorFromRGB(0xffffff);
        _backView.layer.cornerRadius = 5;
        _backView.layer.masksToBounds = YES;
    }
    return _backView;
}

- (UIView*)shadowView {
    if (!_shadowView) {
        _shadowView = [UIView new];
        _shadowView.layer.shadowColor = UIColorFromRGBA(0xB4B6C0, 0.3).CGColor;
        _shadowView.layer.shadowOffset = CGSizeMake(0, 6);
        _shadowView.layer.shadowOpacity = 0.3;
        _shadowView.layer.shadowRadius = 15;
    }
    return _shadowView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = UIColorFromRGB(0x1D202C);
        _titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];
    }
    return _titleLabel;
}

- (UILabel *)descLabel
{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc]init];
        _descLabel.textColor = UIColorFromRGB(0x4A4E5E);
        _descLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightSemibold];
        _descLabel.numberOfLines = 0;
    }
    return _descLabel;
}

- (UILabel *)goLabel
{
    if (!_goLabel) {
        _goLabel = [[UILabel alloc]init];
        _goLabel.textColor = UIColorFromRGB(0x395CFE);
        _goLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightSemibold];
        _goLabel.text = @"立即绑定 >";
    }
    return _goLabel;
}


- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = UIImageView.new;
        _iconView.backgroundColor = [UIColor clearColor];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        _iconView.image = [UIImage imageNamed:@"srx_report_wechat"];
    }
    return _iconView;
}

- (UIImageView *)arrowView {
    if (!_arrowView) {
        _arrowView = UIImageView.new;
        _arrowView.backgroundColor = [UIColor clearColor];
        _arrowView.contentMode = UIViewContentModeScaleAspectFit;
        _arrowView.image = [UIImage imageNamed:@"sr_istm_icon_arrow"];
    }
    return _arrowView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.backView.bounds;
    _gradientLayer.frame = bounds;
}

- (void)updateInfo:(InfoStreamItemModel *)info {
    [super updateInfo:info];
    InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
    
    self.titleLabel.text = model.title;
    self.descLabel.text = model.subtitle;
    self.goLabel.text = model.subTitle2;
    
    if (model.icon.length > 0) {
        if ([model.icon hasPrefix:@"http"]) {
            [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.icon?:@"http"]];
        }else {
            self.iconView.image = [UIImage imageNamed:model.icon];
        }
    }else {
        self.iconView.image = nil;
    }
}


+ (CGSize)sizeForItem:(InfoStreamItemModel *)info
{
    InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
    NSString *content = model.subtitle;
    
    int height = 0;
    CGRect rect = [content boundingRectWithSize:CGSizeMake(ScreenWidth - (kMarginX*2+14+30+10)-kTextMarginRight, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]} context:nil];
    height += rect.size.height; //文本框高度
    height = 20+30+10 + height + 25; //圆角框高度
    height += 5*2; //cell高度
    return CGSizeMake(ScreenWidth, height);
}

@end
