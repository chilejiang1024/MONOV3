//
//  MineViewController.m
//  MONOV3
//
//  Created by JiangChile on 16/3/23.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "MineViewController.h"

#import "MineSignInView.h"

@interface MineViewController ()<MineSignInViewDelegate>



@end


@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createView];
}

#pragma mark - create view (signInView or Mine View)

- (void)createView {
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"username"]) {
        // already sign in
        
    } else {
        // not sign in
        [self createSignInView];
    }
}

- (void)createSignInView {
    MineSignInView *signInView = [MineSignInView.alloc initWithFrame:self.view.bounds];
    signInView.delegate = self;
    [self.view addSubview:signInView];
}

- (void)createMineView {
    
}

- (void)clickLoginType:(NSInteger)type{
    NSLog(@"%ld", type);
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
