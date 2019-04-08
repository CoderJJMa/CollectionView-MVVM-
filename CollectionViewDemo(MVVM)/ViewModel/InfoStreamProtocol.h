//
//  InfoStreamProtocol.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#ifndef InfoStreamProtocol_h
#define InfoStreamProtocol_h


@class InfoStreamViewModel;
@protocol InfoStreamProtocol <NSObject>


- (void)infoStreamModel:(InfoStreamViewModel *)viewModel listRequestSuccess:(BOOL)success;
- (void)infoStreamModel:(InfoStreamViewModel *)viewModel reloadListAtIndex:(NSInteger)cardIndex;

@end

#endif /* InfoStreamProtocol_h */
