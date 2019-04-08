//
//  UIView+FLKit.h
//  smart
//
//  Created by jun on 16/5/10.
//  Copyright © 2016年 ifenglian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)

@property (nonatomic) CGFloat fl_left;
@property (nonatomic) CGFloat fl_top;
@property (nonatomic) CGFloat fl_right;
@property (nonatomic) CGFloat fl_bottom;
@property (nonatomic) CGFloat fl_width;
@property (nonatomic) CGFloat fl_height;
@property (nonatomic) CGFloat fl_centerX;
@property (nonatomic) CGFloat fl_centerY;
@property (nonatomic) CGPoint fl_origin;
@property (nonatomic) CGSize  fl_size;

@property (nonatomic, strong) UIView * topLine;
@property (nonatomic, strong) UIView * bottomLine;
@property (nonatomic, strong) UIView * leftLine;
@property (nonatomic, strong) UIView * rightLine;

@end

@interface UIView (screenShot)

- (UIImage *)screenShot;
- (UIImage *)screenShotWithRect:(CGRect)rect;

@end

@interface UIImage (Utils)
-(UIImage*)subImage:(CGRect)rect;
@end


