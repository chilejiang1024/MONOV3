//
//  TabBarViewController.m
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "TabBarViewController.h"

#import "NewFeedsViewController.h"
#import "MineViewController.h"
#import "ReminderViewController.h"
#import "FindViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"bg-tab"];
    self.tabBar.backgroundColor = [UIColor blackColor];
    self.tabBar.opaque          = NO;
    self.tabBar.alpha           = 0.9;
    
    NewFeedsViewController *newFeedsVC = [NewFeedsViewController.alloc init];
    FindViewController     *findVC = [FindViewController.alloc init];
    ReminderViewController *reminderVC = [ReminderViewController.alloc init];
    MineViewController     *mineVC = [MineViewController.alloc init];
    
    
    [self addChildVC:newFeedsVC Title:@"动态" ImageName:@"iconfont-m" SelectedImageName:@"iconfont-m-selected"];
    [self addChildVC:findVC     Title:@"发现" ImageName:@"iconfont-o" SelectedImageName:@"iconfont-o-selected"];
    [self addChildVC:reminderVC Title:@"提醒" ImageName:@"iconfont-n" SelectedImageName:@"iconfont-n-selected"];
    [self addChildVC:mineVC     Title:@"我的" ImageName:@"iconfont-o" SelectedImageName:@"iconfont-o-selected"];
    
}

- (void)addChildVC:(UIViewController *)childVC Title:(NSString *)title ImageName:(NSString *)imageName SelectedImageName:(NSString *)selectedImageName {
    
    childVC.title = title;
    
    childVC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSDictionary *dic  = @{NSForegroundColorAttributeName : MONO_COLOR};
    NSDictionary *dic2 = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    [childVC.tabBarItem setTitleTextAttributes:dic  forState:UIControlStateSelected];
    [childVC.tabBarItem setTitleTextAttributes:dic2 forState:UIControlStateNormal];
    
    [self addChildViewController:childVC];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
