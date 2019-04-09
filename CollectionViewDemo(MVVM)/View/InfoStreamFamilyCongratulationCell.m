//
//  InfoStreamFamilyCongratulationCell.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/9.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamFamilyCongratulationCell.h"
#import "Common.h"
#import "InfoStreamFamilyItemModel.h"

static CGFloat const kMarginX = 10;
static CGFloat const kMarginLeft = 18;
static CGFloat const kMarginTxtThumb = 17;
static CGFloat const kMarginTitleDesc = 15;
static CGFloat const kThumbnailWidth = 92;
static CGFloat const kMarginRight = 20;
static CGFloat const kThumbnailHeight = 92.0;
static CGFloat const kMarginY = 30.0f;

@interface InfoStreamFamilyCongratulationCell()

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *descLabel;
@property(nonatomic, strong) UIImageView *thumbnailImageView;

@property(nonatomic, strong)UIView *backView;
@property(nonatomic, strong)UIView *shadowView;


@end

@implementation InfoStreamFamilyCongratulationCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        [self initViews];
    }
    return self;
}



- (void)initViews {
    
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
    
    [self.backView addSubview:self.titleLabel];
    [self.backView addSubview:self.descLabel];
    [self.backView addSubview:self.thumbnailImageView];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kMarginY);
        make.left.mas_equalTo(kMarginLeft);
    }];
    
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kMarginLeft);
        make.right.mas_equalTo(self.thumbnailImageView.mas_left).mas_offset(-kMarginTxtThumb);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(kMarginTitleDesc);
    }];
    
    [self.thumbnailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kThumbnailWidth);
        make.height.mas_equalTo(kThumbnailWidth);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(-kMarginRight);
    }];
    self.thumbnailImageView.hidden = YES;
    
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
        _shadowView.layer.shadowColor = UIColorFromRGBA(0x959FBA, 0.3).CGColor;
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
        _titleLabel.textColor = UIColorFromRGB(0x395CFE);
        _titleLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightSemibold];
        _titleLabel.numberOfLines = 1;
    }
    return _titleLabel;
}


- (UILabel *)descLabel
{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc]init];
        _descLabel.textColor = UIColorFromRGB(0xB4B6C0);
        _descLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightSemibold];
        _descLabel.numberOfLines = 0;
    }
    return _descLabel;
}



- (UIImageView *)thumbnailImageView {
    if (!_thumbnailImageView) {
        _thumbnailImageView = [UIImageView new];
    }
    return _thumbnailImageView;
}

- (void)updateInfo:(InfoStreamItemModel *)info {
    [super updateInfo:info];
    InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
    self.titleLabel.text = model.title;
    self.descLabel.text = model.subtitle;
    
    self.thumbnailImageView.image = [UIImage imageNamed:model.icon];
    
}


+ (CGSize)sizeForItem:(InfoStreamItemModel *)info
{
    InfoStreamFamilyItemModel *md = (InfoStreamFamilyItemModel*)info;
    
    NSString *content = md.subtitle;
    int height = 120;
    CGRect rect = [content boundingRectWithSize:CGSizeMake(ScreenWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]} context:nil];
    height += rect.size.height;
    return CGSizeMake(ScreenWidth, height);

}

@end
