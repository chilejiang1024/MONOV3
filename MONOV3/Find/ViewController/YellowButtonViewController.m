//
//  YellowButtonViewController.m
//  MONOV3
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "YellowButtonViewController.h"
#import "YellowButtonView.h"
#import "FindViewCatalogueModel.h"
#import "AFNetworking.h"
#import "TagsModel.h"
#import "MeowsModel.h"

#import "MONOTools.h"

@interface YellowButtonViewController ()

@end

@implementation YellowButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createFirstTimeData];
    [self createYellowBtnView];
}

- (void)createFirstTimeData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"mmmono.com" forHTTPHeaderField:@"Host"];
    [manager.requestSerializer setValue:@"c3a2c55eebe811e597b1525400097b5b" forHTTPHeaderField:@"HTTP-AUTHORIZATION"];
    [manager GET:@"http://mmmono.com/api/v3/domain_category/100011/?" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray *arrayTags = [TagsModel getTagsModelArray:responseObject];
        NSMutableArray *arrayMeows = [MeowsModel getMeowsModelArray:responseObject];
        NSDictionary *dicArr = @{@"arrayTags":arrayTags, @"arrayMeows":arrayMeows};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"firstLoadData" object:@"yes" userInfo:dicArr];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
    }];
}


- (void)createYellowBtnView{
    
    YellowButtonView *yellowButtonView = [[YellowButtonView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:yellowButtonView];
    
    [FindViewCatalogueModel getFindViewCatalogueModel:^(NSMutableArray *array) {
        [yellowButtonView createTitleScrollView:array];
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickBack) name:@"back" object:nil];
}

- (void)clickBack{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
