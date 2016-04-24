//
//  ExploreViewController.m
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "ExploreViewController.h"

#import "ExploreView.h"
#import "AFNetworking.h"
#import "ExPloreModelArr.h"

@interface ExploreViewController ()

@property (nonatomic, retain) NSMutableArray *exploreModelArr;

@property (nonatomic, retain) ExploreView *exploreView;

/** 请求参数 */
@property (nonatomic, assign) NSInteger start;

@end


@implementation ExploreViewController

- (NSMutableArray *)exploreModelArr{
    if (!_exploreModelArr) {
        _exploreModelArr = [NSMutableArray array];
    }
    return _exploreModelArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createView];
    
    self.start = 0;
    [self createData];
}

#pragma mark - 请求数据

- (void)createData{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"c3a2c55eebe811e597b1525400097b5b" forHTTPHeaderField:@"HTTP-AUTHORIZATION"];
    [manager.requestSerializer setValue:@"mmmono.com" forHTTPHeaderField:@"Host"];
    
    [manager GET:[NSString stringWithFormat:URL_NEWFEEDS_EXPLORE, self.start] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.exploreModelArr addObjectsFromArray:[ExPloreModelArr getExPloreModelArray:responseObject]];
        self.start = [responseObject[@"start"] integerValue];
        if (self.exploreModelArr.count > 0) {
            [self.exploreView setExploreModelArr:self.exploreModelArr];
        } else {
            [self getDataWhenExploreIsNULL];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}

- (void)getDataWhenExploreIsNULL {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"c3a2c55eebe811e597b1525400097b5b" forHTTPHeaderField:@"HTTP-AUTHORIZATION"];
    [manager.requestSerializer setValue:@"mmmono.com" forHTTPHeaderField:@"Host"];
    
    [manager GET:URL_NEWFEEDS_TEA parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.exploreModelArr addObjectsFromArray:[ExPloreModelArr getExPloreModelArray:responseObject[@"tea"]]];
        [self.exploreView setExploreModelArr:self.exploreModelArr];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - careate view

- (void)createView {
    self.exploreView = [ExploreView.alloc initWithFrame:self.view.bounds];
    [self.view addSubview:self.exploreView];
    
    __block typeof(self) weakSelf = self;
    self.exploreView.tableView.tableViewRefreshBlock = ^(){
        weakSelf.start = 1;
        [weakSelf createData];
    };
    self.exploreView.tableView.tableViewLoadMoreBlock = ^(){
        [weakSelf createData];
    };
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
