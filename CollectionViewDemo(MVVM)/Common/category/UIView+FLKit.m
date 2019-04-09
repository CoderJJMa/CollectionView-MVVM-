
#import "UIView+FLKit.h"
#import <objc/runtime.h>

#define UIColorFromRGB(c)   [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]

@implementation UIView (Utils)

- (CGFloat)fl_left
{
    return self.frame.origin.x;
}
- (void)setFl_left:(CGFloat)fl_left
{
    CGRect rect = self.frame;
    rect.origin.x = fl_left;
    self.frame = rect;
}
- (CGFloat)fl_top
{
    
    return self.frame.origin.y;
}
- (void)setFl_top:(CGFloat)fl_top
{
    CGRect rect = self.frame;
    rect.origin.y = fl_top;
    self.frame = rect;
}
- (CGFloat)fl_right
{
    return self.frame.origin.x+self.frame.size.width;
}
- (void)setFl_right:(CGFloat)fl_right
{
    CGRect rect = self.frame;
    rect.origin.x = fl_right-rect.size.width;
    self.frame = rect;
}
- (CGFloat)fl_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setFl_bottom:(CGFloat)fl_bottom
{
    CGRect rect = self.frame;
    rect.origin.y = fl_bottom - rect.size.height;
    self.frame = rect;
}
- (CGFloat)fl_width
{
    return self.frame.size.width;
}
- (void)setFl_width:(CGFloat)fl_width
{
    CGRect rect = self.frame;
    rect.size.width = fl_width;
    self.frame = rect;
}
- (CGFloat)fl_height
{
    return self.frame.size.height;
}
- (void)setFl_height:(CGFloat)fl_height
{
    CGRect rect = self.frame;
    rect.size.height = fl_height;
    self.frame = rect;
}
- (CGFloat)fl_centerX
{
    return self.center.x;
}
- (void)setFl_centerX:(CGFloat)fl_centerX
{
    self.center = CGPointMake(fl_centerX, self.center.y);
}
- (CGFloat)fl_centerY
{
    return self.center.y;
}
- (void)setFl_centerY:(CGFloat)fl_centerY
{
    self.center = CGPointMake(self.center.x, fl_centerY);
}
- (CGPoint)fl_origin
{
    return self.frame.origin;
}
- (void)setFl_origin:(CGPoint)fl_origin
{
    self.frame = (CGRect){fl_origin,self.frame.size};
}
- (CGSize)fl_size
{
    return self.frame.size;
}
- (void)setFl_size:(CGSize)fl_size
{
    CGRect rect = (CGRect){self.frame.origin,fl_size};
    self.frame = rect;
}


- (UIView *)line
{
    UIView * line = [[UIView alloc] init];
    line.fl_height = 0.5;
    line.fl_width = 0.5;
    line.backgroundColor = UIColorFromRGB(0xe6e6e6);
    return line;
}


static char kTopLine,kBottomLine,kLeftLine,kRightLine;

- (UIView*)topLine
{
    UIView * rt = objc_getAssociatedObject(self, &kTopLine);
    if(!rt)
    {
        UIView * line = [self line];
        objc_setAssociatedObject(self, &kTopLine, line, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        rt = line;
        [self addSubview:line];
    }
    return rt;
}
- (UIView*)bottomLine
{
    UIView * rt = objc_getAssociatedObject(self, &kBottomLine);
    if(!rt)
    {
        UIView * line = [self line];
        objc_setAssociatedObject(self, &kBottomLine, line, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        rt = line;
        [self addSubview:line];
    }
    return rt;
}
- (UIView*)leftLine
{
    UIView * rt = objc_getAssociatedObject(self, &kLeftLine);
    if(!rt)
    {
        UIView * line = [self line];
        objc_setAssociatedObject(self, &kLeftLine, line, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        rt = line;
        [self addSubview:line];
    }
    return rt;
}
- (UIView*)rightLine
{
    UIView * rt = objc_getAssociatedObject(self, &kRightLine);
    if(!rt)
    {
        UIView * line = [self line];
        objc_setAssociatedObject(self, &kRightLine, line, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        rt = line;
        [self addSubview:line];
    }
    return rt;
}



- (void)layoutSubviews
{
    UIView * line = objc_getAssociatedObject(self, &kTopLine);
    if(line)
    {
        line.fl_width = self.fl_width;
        line.fl_top = 0;
        line.fl_left = 0;
        
    }
    line = objc_getAssociatedObject(self, &kBottomLine);
    if(line)
    {
        line.fl_width = self.fl_width;
        line.fl_bottom = self.fl_height;
        line.fl_left = 0;
        
    }
    line = objc_getAssociatedObject(self, &kLeftLine);
    if(line)
    {
        line.fl_height = self.fl_height;
        line.fl_top = 0;
        line.fl_left = 0;
        
    }
    
    line = objc_getAssociatedObject(self, &kRightLine);
    if(line)
    {
        line.fl_height = self.fl_height;
        line.fl_top = 0;
        line.fl_right = self.fl_width;
        
    }
}



@end

@implementation UIView (screenShot)

- (UIImage *)screenShot
{
    return [self screenShotWithRect:self.bounds];
}

- (UIImage *)screenShotWithRect:(CGRect)rect;
{
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (context == NULL)
    {
        return nil;
    }
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y);
    
    //[self layoutIfNeeded];
    /*
    if( [self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
    {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    }
    else
    {
        [self.layer renderInContext:context];
    }
     */
    [self.layer renderInContext:context];
    
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //    NSData *imageData = UIImageJPEGRepresentation(image, 1); // convert to jpeg
    //    image = [UIImage imageWithData:imageData scale:[UIScreen mainScreen].scale];
    
    return image;
}

@end
@implementation UIImage (Utils)

-(UIImage*)subImage:(CGRect)rect
{
    CGFloat scale = self.scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, dianRect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef scale:self.scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();
    
    CGImageRelease(subImageRef);
    
    return smallImage;
}

@end
