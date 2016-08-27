//
//  BasicTabBarController.m
//  xiaoquchaoshi
//
//  Created by caohaifeng on 8/26/16.
//  Copyright © 2016 大连友商科技有限公司. All rights reserved.
//

#import "BasicTabBarController.h"

#import "BasicNavigationController.h"
#import "OrderOperationController.h"
#import "CompleteOrderController.h"
#import "MoreController.h"

@implementation BasicTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllerWith:[[OrderOperationController alloc] init] andTitle:@"订单操作" andImageName:@"order"];
    [self addChildViewControllerWith:[[CompleteOrderController alloc] init]andTitle:@"完成订单" andImageName:@"wancheng"];
    [self addChildViewControllerWith:[[MoreController alloc] init] andTitle:@"更多" andImageName:@"more"];
    self.tabBar.tintColor = [UIColor redColor];
    self.childViewControllers[0].tabBarItem.image=[UIImage imageNamed:@"tab1"];
    self.childViewControllers[1].tabBarItem.image=[UIImage imageNamed:@"tab22"];
    self.childViewControllers[2].tabBarItem.image=[UIImage imageNamed:@"tab3"];
    
}

//添加单个子控制器
- (void)addChildViewControllerWith:(UIViewController *)viewController andTitle:(NSString *)title andImageName:(NSString *)imageName {
    BasicNavigationController *base = [[BasicNavigationController alloc] initWithRootViewController:viewController];
    viewController.navigationItem.title = title;
    viewController.title = title;
    NSString *nomalName = [NSString stringWithFormat:@"icon-sy-%@",imageName];
    NSString *selectName = [NSString stringWithFormat:@"icon-sy-dj%@",imageName];
    viewController.tabBarItem.image  = [UIImage imageNamed:nomalName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectName];
    [self addChildViewController:base];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
