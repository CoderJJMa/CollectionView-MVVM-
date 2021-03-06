//
//  InfoStreamFamilyCollectionFooterCell.m
//
//  Created by majianjie on 2019/4/3.
//  Copyright © 2019 360. All rights reserved.
//

#import "InfoStreamFamilySectionFooterCell.h"
#import "InfoStreamFamilyItemModel.h"

@interface InfoStreamFamilySectionFooterCell()

@property (nonatomic,strong)UILabel *contentLabel;
@property (nonatomic, strong) UIView *line;

@end


@implementation InfoStreamFamilySectionFooterCell

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
    self.contentLabel.textColor = UIColorFromRGB(0x596c95);
    self.contentLabel.font = [UIFont boldSystemFontOfSize:14];
    self.contentLabel.numberOfLines = 11;
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(74);
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

}

- (void)updateInfo:(InfoStreamItemModel *)info {
    InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
    self.contentLabel.text = model.title;
}

+ (CGSize)sizeForItem:(InfoStreamItemModel *)info
{
    InfoStreamFamilyItemModel *model = (InfoStreamFamilyItemModel*)info;
    NSString *content = model.desc;

    int height = 50;
    CGRect rect = [content boundingRectWithSize:CGSizeMake(ScreenWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]} context:nil];
    height += rect.size.height;
    return CGSizeMake(ScreenWidth, height);
}

@end
