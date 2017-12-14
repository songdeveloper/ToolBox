//
//  LKTabBarController.m
//  LKHealthClub
//
//  Created by songhuipan on 2017/7/31.
//  Copyright © 2017年 songhuipan. All rights reserved.
//

#import "LKTabBarController.h"
#import "LKNavigationController.h"
#import "LKLessonViewController.h"
#import "LKFriendViewController.h"
#import "LKHonourViewController.h"
#import "LKMineViewController.h"

@interface LKTabBarController ()
@property (nonatomic,assign)NSInteger lastSelect;
@property (nonatomic,strong)NSMutableArray *items;
@end

@implementation LKTabBarController

- (instancetype)init {
    
    if (self = [super init]) {
        
        LKNavigationController *lessonNav = [[LKNavigationController alloc]initWithRootViewController:[[LKLessonViewController alloc]init]];
        
        LKNavigationController *friendNav = [[LKNavigationController alloc]initWithRootViewController:[[LKFriendViewController alloc]init]];
        
        LKNavigationController *honourNav = [[LKNavigationController alloc]initWithRootViewController:[[LKHonourViewController alloc]init]];
        
        LKNavigationController *mineNav = [[LKNavigationController alloc]initWithRootViewController:[[LKMineViewController alloc]init]];
        
        lessonNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"开课" image:LKImage(@"tab_play_normal") selectedImage:LKImage(@"tab_play_selected")];
        friendNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"朋友" image:LKImage(@"tab_haoyou_normal") selectedImage:LKImage(@"tab_haoyou_selected")];
        honourNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"成就" image:LKImage(@"tab_chengjiu_normal") selectedImage:LKImage(@"tab_chengjiu_selected")];
        mineNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我" image:LKImage(@"tab_wode_normal") selectedImage:LKImage(@"tab_wode_selected")];


        self.viewControllers = @[lessonNav,friendNav,honourNav,mineNav];
        
    }
    return self;
}

# pragma mark - 实现tabBarItem点击先变大后恢复的动画
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    if (!self.items.count) {
        
        self.items = @[].mutableCopy;
        self.lastSelect = 0;
        // 这里测试发现subviews在viewDidLoad方法中为空，所以需要写在这里
        for (UIView *view in self.tabBar.subviews) {
            if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [self.items addObject:view];
            }
        }
    }

    NSInteger index = [tabBar.items indexOfObject:item];
    if (index != self.lastSelect) {
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        //速度控制函数，控制动画运行的节奏
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.duration = 0.2;       //执行时间
        animation.repeatCount = 1;      //执行次数
        animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
        animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
        animation.toValue = [NSNumber numberWithFloat:1.3];     //结束伸缩倍数
        [[self.items[index] layer] addAnimation:animation forKey:nil];

    }
    self.lastSelect = index;
}


@end
