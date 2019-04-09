//
//  InfoStreamViewController.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamViewController.h"
#import "Common.h"
#import "InfoStreamFamilyViewModel.h"
#import "InfoStreamFamilyView.h"
#import "InfoStreamFamilySectionModel.h"
#import "MBProgressHUD+Text.h"

@interface InfoStreamViewController ()<InfoStreamViewDelegate, InfoStreamProtocol>

@property (nonatomic, strong) InfoStreamFamilyViewModel *model;
@property (nonatomic, strong) InfoStreamFamilyView *detailView;

@end

@implementation InfoStreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configUI];
}

- (void)configUI{
    

    InfoStreamFamilyView *detailView = [[InfoStreamFamilyView alloc] initWithFrame:CGRectMake(0, 0 , ScreenWidth, ScreenHeight )];
    detailView.delegate = self;
    [self.view addSubview:detailView];
    self.detailView = detailView;
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(ScreenHeight);
    }];
    
    self.model = [InfoStreamFamilyViewModel new];
    self.model.delegate = self;
    
    [self.model requestListWithRouter:[NSDictionary dictionary]];
    
}


#pragma mark - InfoStreamViewDelegate
//点击item的事件
- (void)infoStreamView:(InfoStreamView *)detailView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 这里要区分type
    InfoStreamFamilySectionModel *sec = [self.model sectionModelWithIndexPath:indexPath];
    
    Class rawClass = rawDataClassWithLogicalType(sec.logicalType);
    if(rawClass && ![sec.rawData isKindOfClass:rawClass]) {
        NSAssert(NO, @"raw data not same exception");
    }
    
    if (sec.logicalType == InfoStreamFamilySectionLogicalType_Role)
    {
        if ([sec.rawData isKindOfClass:[RoleInfoStreamDatasFolkInfo class]]) {
            RoleInfoStreamDatasFolkInfo *folk = (RoleInfoStreamDatasFolkInfo*)sec.rawData;
            [self toast:@"消息类型中的角色"];
        }
        
    }else if (sec.logicalType == InfoStreamFamilySectionLogicalType_Message) {
        InfoStreamItemModel *item = [sec.infos objectAtIndex:indexPath.row];
        if (item.infoStyle == InfoStreamItemStyleSectionHeader) {
            //do nothing  消息类型中的header
            [self toast:@"消息类型中的header"];
        }else  if (item.infoStyle == InfoStreamItemStyleSectionFooter){
            [self toast:@"点击了查看详情报告"];
        }else{
            [self toast:@"点击了消息类型中的message"];
        }
    }else if (sec.logicalType ==InfoStreamFamilySectionLogicalType_BeginProtection ){
        [self toast:@"点击了开始守护"];
    }else if (sec.logicalType ==InfoStreamFamilySectionLogicalType_BoundingWechat ){
        [self toast:@"点击了绑定微信"];
    }else if (sec.logicalType ==InfoStreamFamilySectionLogicalType_LightProtection ){
        [self toast:@"点击了点亮守护"];
    }else if (sec.logicalType ==InfoStreamFamilySectionLogicalType_Congratulation ){
        [self toast:@"点击了恭喜"];
    }
    
    
}

- (void)toast:(NSString *)toast{
    [MBProgressHUD showMessage:toast toView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view];
    });
}

//点击section header或者footer等的事件
- (void)infoStreamView:(InfoStreamView *)detailView didSelectSectionOfActionType:(InfoStreamActionType)actionType andValue:(id)value atIndex:(NSIndexPath *)indexPath {
    InfoStreamFamilySectionModel *sec = [self.model sectionModelWithIndexPath:indexPath];
    
    Class rawClass = rawDataClassWithLogicalType(sec.logicalType);
    if(![sec.rawData isKindOfClass:rawClass]) {
        NSAssert(NO, @"raw data not same exception");
    }
    
    if (actionType == InfoStreamActionTypeItemRightArrow) {

    }
}

#pragma mark - InfoStreamProtocol
- (void)infoStreamModel:(InfoStreamViewModel *)viewModel listRequestSuccess:(BOOL)success {
    [self.detailView updateData:viewModel.infoCards];
}


- (void)infoStreamModel:(InfoStreamViewModel *)viewModel reloadListAtIndex:(NSInteger)cardIndex {
    
}

@end
