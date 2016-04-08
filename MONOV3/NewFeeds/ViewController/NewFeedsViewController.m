//
//  NewFeedsViewController.m
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "NewFeedsViewController.h"

#import "NewFeedsView.h"

@interface NewFeedsViewController ()

@property (nonatomic, strong) NewFeedsView *feedsView;

@end


@implementation NewFeedsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createView];
    
    
}

#pragma mark - create View 

- (void)createView {
    self.feedsView = [NewFeedsView.alloc initWithFrame:self.view.bounds];
    [self.view addSubview:self.feedsView];
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
