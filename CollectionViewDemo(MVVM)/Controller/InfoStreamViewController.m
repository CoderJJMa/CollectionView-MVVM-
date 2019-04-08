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

        }
        
    }else if (sec.logicalType == InfoStreamFamilySectionLogicalType_Message) {
        InfoStreamItemModel *item = [sec.infos objectAtIndex:indexPath.row];
        if (item.infoStyle == InfoStreamItemStyleSectionHeader) {
            //do nothing
        }else {
            
        }
    }
    
    
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
