//
//  MusicViewController.m
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "MusicViewController.h"
#import "AFNetworking.h"
#import "VideoAndMusicModelArr.h"

#import "MusicView.h"

@interface MusicViewController ()

/** data source */
@property (nonatomic, retain) NSMutableArray *musicModelArr;

@property (nonatomic, assign) NSInteger start;

/** view */
@property (nonatomic, retain) MusicView *musicView;

@end


@implementation MusicViewController

- (NSMutableArray *)musicModelArr{
    if (!_musicModelArr) {
        _musicModelArr = [NSMutableArray array];
    }
    return _musicModelArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createView];
    
    self.start = 0;
    [self createData];
}

#pragma mark - create view

- (void)createView {
    self.musicView = [MusicView.alloc initWithFrame:self.view.bounds];
    [self.view addSubview:self.musicView];
    
    __block typeof(self) weakSelf = self;
    self.musicView.tableView.tableViewRefreshBlock = ^{
        weakSelf.start = 0;
        [weakSelf.musicModelArr removeAllObjects];
        [weakSelf createData];
    };
    self.musicView.tableView.tableViewLoadMoreBlock = ^{
        [weakSelf createData];
    };
}

#pragma mark - get data

- (void)createData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"c3a2c55eebe811e597b1525400097b5b" forHTTPHeaderField:@"HTTP-AUTHORIZATION"];
    [manager.requestSerializer setValue:@"mmmono.com" forHTTPHeaderField:@"Host"];
    [manager GET:[NSString stringWithFormat:URL_NEWFEEDS_MUSIC, self.start] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.musicModelArr addObjectsFromArray:[VideoAndMusicModelArr getVideoAndMusicModelArr:responseObject]];
        self.start = [responseObject[@"start"] integerValue];
        [self.musicView setMusicModelArr:self.musicModelArr];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
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
