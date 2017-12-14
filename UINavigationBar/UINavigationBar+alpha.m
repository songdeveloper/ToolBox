//
//  UINavigationBar+navAlpha.m
//  编程题
//
//  Created by songhuipan on 16/5/28.
//  Copyright © 2016年 songhuipan. All rights reserved.
//

#import "UINavigationBar+alpha.h"
#import <objc/runtime.h>

@implementation UINavigationBar (alpha)
static char overlayKey;

- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)shp_setNavigatonBarBackgroundColor:(UIColor *)backgroundColor {
    
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth;    // Should not set `UIViewAutoresizingFlexibleHeight`
        [[self.subviews firstObject] insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;
}

# pragma mark - 保护导航栏恢复系统原样
- (void)shp_resetNavigationBar {
    
    if (self.overlay) {
        [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [self.overlay removeFromSuperview];
        self.overlay = nil;
    }
    
}






@end
