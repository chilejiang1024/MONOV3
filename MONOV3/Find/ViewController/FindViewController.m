//
//  FindViewController.m
//  MONOV3
//
//  Created by JiangChile on 16/3/23.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "FindViewController.h"
#import "FindModel.h"
#import "AFNetworking.h"
#import "FindView.h"
#import "Ref_campaign.h"
#import "Collection.h"
#import "YellowButtonViewController.h"
#import "BlackButtonViewController.h"
#import "LoadMoreFindModel.h"
#import "Campaign.h"

@interface FindViewController ()<FindViewDelegate>

@property (nonatomic, strong) FindView *findView;

@property (nonatomic, strong) NSMutableArray *arrModel;
@property (nonatomic, strong) NSMutableArray *arrItemFourModel;
@property (nonatomic, strong) NSMutableArray *arrItemSixModel;
@property (nonatomic, strong) NSMutableArray *arrAll;
@property (nonatomic, strong) NSMutableArray *arrHeaderAll;
@property (nonatomic, copy) NSString *start;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self createView];
    [self getData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downRefresh) name:@"updateData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upRefresh) name:@"loadData" object:nil];
}


- (void)getData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"mmmono.com" forHTTPHeaderField:@"Host"];
    [manager.requestSerializer setValue:@"c3a2c55eebe811e597b1525400097b5b" forHTTPHeaderField:@"HTTP-AUTHORIZATION"];
    [manager GET:@"http://mmmono.com/api/v3/new_explore/?" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        FindModel *model = [FindModel findModelWithDic:responseObject];
        self.start = model.start;
        
        // 轮播图解析
        self.arrModel = [NSMutableArray array];
        for (int i = 0; i < model.top_banner.entity_list.count; i++) {
            NSString *str = [model.top_banner.entity_list[i] banner_img_url];
            [self.arrModel addObject:str];
        }
        [self.findView setLunBoTuArray:self.arrModel];
        
        // item解析
        // 数组初始化
        self.arrItemFourModel = [NSMutableArray array];
        self.arrItemSixModel = [NSMutableArray array];
        self.arrAll = [NSMutableArray array];
        
        for (Group *group in [model.mod_list[0] entity_list]) {
            [self.arrItemFourModel addObject:group];
        }
        [self.arrAll addObject:self.arrItemFourModel];
        for (Group *group in [model.mod_list[2] entity_list]) {
            [self.arrItemSixModel addObject:group];
        }
        [self.arrAll addObject:self.arrItemSixModel];
        [self.findView getItemArr:self.arrAll];
        
        // 头视图解析
        self.arrHeaderAll = [NSMutableArray array];
        Meow *meowModel = [[model.mod_list[1] entity_list][0] meow];
        [self.arrHeaderAll addObject:meowModel];

        Collection *collection = [model.mod_list[3] entity_list][0];
        [self.arrHeaderAll addObject:collection];
        [self.findView getHeaderAllArr:self.arrHeaderAll];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}

#pragma mark - create View
- (void)createView {
    self.findView = [[FindView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.findView.delegateA = self;
    [self.view addSubview:self.findView];
}

- (void)FindViewTopFiveButClickMethod:(NSInteger)sender{
    YellowButtonViewController *yellow = [[YellowButtonViewController alloc] init];
    BlackButtonViewController *black = [[BlackButtonViewController alloc] init];
    
    switch (sender) {
        case 10086:
            [self presentViewController:yellow animated:YES completion:^{
                
            }];
             break;
            
        case 10087:
            [self presentViewController:black animated:YES completion:^{
                
            }];
            break;
            
        default:
            break;
    }
}

#pragma mark - 下拉刷新数据

- (void)downRefresh {
    [self getData];
}

#pragma mark - 上拉加载数据
- (void)upRefresh {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"mmmono.com" forHTTPHeaderField:@"Host"];
    [manager.requestSerializer setValue:@"c3a2c55eebe811e597b1525400097b5b" forHTTPHeaderField:@"HTTP-AUTHORIZATION"];
    [manager GET:[NSString stringWithFormat:@"http://mmmono.com/api/v3/new_explore/?start=%@", self.start] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        LoadMoreFindModel *loadMoreFindModel = [[LoadMoreFindModel alloc] initWithDic:responseObject];
        self.start = loadMoreFindModel.start;
        // item解析
        // 数组初始化
        self.arrItemFourModel = [NSMutableArray array];
        self.arrItemSixModel = [NSMutableArray array];
        self.arrAll = [NSMutableArray array];
        
        for (Group *group in [loadMoreFindModel.mod_list[0] entity_list]) {
            [self.arrItemFourModel addObject:group];
        }
        [self.arrAll addObject:self.arrItemFourModel];
        for (Group *group in [loadMoreFindModel.mod_list[2] entity_list]) {
            [self.arrItemSixModel addObject:group];
        }
        [self.arrAll addObject:self.arrItemSixModel];
        [self.findView getItemArr:self.arrAll];
        
        // 头视图解析
        Campaign *campaignModel = [loadMoreFindModel.mod_list[1] entity_list][0];
//        NSLog(@"%@", campaignModel.title);
        [self.arrHeaderAll addObject:campaignModel];
        
        Collection *collection = [loadMoreFindModel.mod_list[3] entity_list][0];
        [self.arrHeaderAll addObject:collection];
        [self.findView getHeaderAllArr:self.arrHeaderAll];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
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
