//
//  NSString+Time.h
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/10.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Time)


+ (NSString*)getDateTextWithTimeStamp:(long long)timeStamp;



@end

NS_ASSUME_NONNULL_END
