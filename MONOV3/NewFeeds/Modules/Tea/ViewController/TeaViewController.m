//
//  TeaViewController.m
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "TeaViewController.h"

#import "TeaModel.h"
#import "TeaDetailModel.h"

#import "BaseView.h"
#import "TeaView.h"
#import "TeaDetailView.h"

#import "BaseCollectionView.h"

#import "CCAFNetWorkTool.h"
#import "MONOTools.h"

@interface TeaViewController ()

@property (nonatomic, strong) NSMutableArray *arrayTeaHistory;

@property (nonatomic, strong) TeaDetailModel *teaDetailModel;

/** tea table view URL 参数 */
@property (nonatomic, assign) NSInteger start;

/** teaView */
@property (nonatomic, strong) TeaView *teaView;

/** teaDetailView */
@property (nonatomic, strong) TeaDetailView *teaDetailView;

/** tea detail model */


@end


@implementation TeaViewController

- (NSInteger)start {
    if (_start < 0) {
        _start = 0;
    }
    return _start;
}

- (NSMutableArray *)arrayTeaHistory {
    if (!_arrayTeaHistory) {
        _arrayTeaHistory = @[].mutableCopy;
    }
    return _arrayTeaHistory;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createView];
    
    [self getDataFromURL];

}

#pragma mark - create tea view & tea detail view & block 实现

- (void)createView {
    self.teaView = [TeaView.alloc initWithFrame:self.view.bounds];
    [self.view addSubview:self.teaView];
    
    // 此处 __weak block内获取到的为null __block 把内容拷贝到全局区
    __block typeof(self) weakSelf = self;
    // 下拉刷新
    self.teaView.collectionView.collectionViewRefreshBlock = ^(){
        weakSelf.start = 0;
        weakSelf.arrayTeaHistory = @[].mutableCopy;
        [weakSelf getDataFromURL];
    };
    // 上拉加载
    self.teaView.collectionView.collectionViewLoadMoreBlock = ^(){
        [weakSelf getDataFromURL];
    };
    // 跳转到详情页面
    self.teaView.goToTeaDetailViewBlock = ^(NSInteger teaId){
        [weakSelf goToTeaDetailView:teaId];
    };
    
}

#pragma mark - get data

- (void)getDataFromURL {
    NSDictionary *header = @{@"HTTP-AUTHORIZATION" : @"c3a2c55eebe811e597b1525400097b5b", @"Host" : @"mmmono.com"};
    [CCAFNetWorkTool getNetWithURL:[NSString stringWithFormat:URL_NEWFEEDS_TEA_HISTORY, self.start] body:nil headFile:header responseStyle:CCResponseJSON success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = responseObject;
        self.start = [dic[@"start"] integerValue];
        [self.arrayTeaHistory addObjectsFromArray:[TeaModel getTeaModelArrayWithArray:dic[@"recent_tea"]]];
        [self.teaView setArrayTeaHistory:self.arrayTeaHistory];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {

    }];
}

- (void)getTeaDetailArrayFromURLWithTeaId:(NSInteger)teaId {
    NSDictionary *header = @{@"HTTP-AUTHORIZATION" : @"c3a2c55eebe811e597b1525400097b5b", @"Host" : @"mmmono.com"};
    [CCAFNetWorkTool getNetWithURL:[NSString stringWithFormat:URL_NEWFEEDS_TEA_DETAIL, teaId] body:nil headFile:header responseStyle:CCResponseJSON success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = responseObject;
        self.teaDetailModel = [TeaDetailModel getTeaDetailModelWithDic:dic[@"tea"]];
        [self.teaDetailView setTeaDetailModel:self.teaDetailModel];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

#pragma mark - 跳转到tea detail view

- (void)goToTeaDetailView:(NSInteger)teaId {
    __block typeof(self) weakSelf = self;
    [self getTeaDetailArrayFromURLWithTeaId:teaId];
    self.teaDetailView = [TeaDetailView.alloc initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [[MONOTools shareMONOTools] addSubview:self.teaDetailView ToView:[[UIApplication sharedApplication] keyWindow] WithMONOAnimator:MONOAnimatorRight];
    // tea detail table view block 实现
    self.teaDetailView.tableView.tableViewRefreshBlock = ^(){
        [weakSelf.teaDetailView.tableView.mj_header endRefreshing];
    };
    
    self.teaDetailView.tableView.tableViewLoadMoreBlock = ^(){
        
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
