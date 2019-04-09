//
//  InfoStreamRefreshHeader.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/8.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "InfoStreamRefreshHeader.h"

@interface InfoStreamRefreshHeader()

@property (nonatomic, strong) UIImageView *loadingImageView;
@property (nonatomic, strong) CABasicAnimation *animation;

@end


@implementation InfoStreamRefreshHeader


- (UIImageView *)loadingImageView
{
    if (!_loadingImageView) {
        _loadingImageView = [[UIImageView alloc] init];
        _loadingImageView.image = [UIImage imageNamed:@"FL_FWRefreshloading"];
    }
    return _loadingImageView;
}

- (CABasicAnimation *)animation
{
    if (!_animation) {
        _animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        _animation.byValue = [NSNumber numberWithFloat:M_PI *2];
        _animation.duration = 0.8;
        _animation.fillMode = kCAFillModeForwards;
        _animation.repeatCount = MAXFLOAT;
    }
    return _animation;
}

- (void)startLoadingViewAnimation
{
    [self.loadingImageView.layer addAnimation:self.animation forKey:nil];
}

- (void)stopLoadingViewAnimation
{
    [self.loadingImageView.layer removeAllAnimations];
}

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    [self addSubview:self.loadingImageView];
    [self.loadingImageView sizeToFit];
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.loadingImageView.center = CGPointMake(self.mj_w *0.5, self.mj_h *0.4);
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            [self stopLoadingViewAnimation];
            break;
        case MJRefreshStatePulling:
            [self stopLoadingViewAnimation];
            break;
        case MJRefreshStateRefreshing:
            [self startLoadingViewAnimation];
            break;
        default:
            break;
    }
}
#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    CGFloat angle = -((pullingPercent - self.pullingPercent) *360) *(M_PI / 180);
    if (self.state != MJRefreshStateRefreshing)
    {
        self.loadingImageView.transform = CGAffineTransformRotate(self.loadingImageView.transform, angle);
    }
    
    [super setPullingPercent:pullingPercent];
}

@end
