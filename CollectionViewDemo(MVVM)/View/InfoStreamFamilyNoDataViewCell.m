//
//  SRXInfoStreamFamilyNoDataViewCell.m
//  SecurityRouterLib
//
//  Created by majianjie on 2019/4/10.
//  Copyright © 2019 360. All rights reserved.
//

#import "InfoStreamFamilyNoDataViewCell.h"
#import "InfoStreamItemModel.h"

@interface InfoStreamFamilyNoDataViewCell()

@property (nonatomic,strong)UILabel *noDataLabel;
@property (nonatomic, strong) UIView *line;

@end


@implementation InfoStreamFamilyNoDataViewCell

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
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.noDataLabel = [[UILabel alloc] init];
    self.noDataLabel.text = @"";
    self.noDataLabel.textColor = UIColorFromRGB(0x7A7E8E);
    self.noDataLabel.font = [UIFont systemFontOfSize:14];
    self.noDataLabel.numberOfLines = 1;

    [self.contentView addSubview:self.noDataLabel];
    [self.noDataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
    
    self.line = [[UIView alloc] init];
    [self.contentView addSubview:self.line];
    self.line.backgroundColor = UIColorFromRGB(0xF1F2F5);
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-1);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(1);
    }];
    
}

- (void)updateInfo:(InfoStreamItemModel *)info {
    [super updateInfo:info];
    InfoStreamItemModel *model = (InfoStreamItemModel*)info;
    self.noDataLabel.text = model.title;
    
}

+ (CGSize)sizeForItem{
  
    return CGSizeMake(ScreenWidth-28, 60);
}

@end
