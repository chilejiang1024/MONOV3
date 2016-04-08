//
//  GalleryViewController.m
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "GalleryViewController.h"
#import "AFNetworking.h"
#import "VideoAndMusicModelArr.h"

#import "GalleryView.h"

@interface GalleryViewController ()

/** data source */
@property (nonatomic, retain) NSMutableArray *galleryModelArr;

/** url 参数 */
@property (nonatomic, assign) NSInteger start;

/** view */
@property (nonatomic, retain) GalleryView *galleryView;


@end

@implementation GalleryViewController

- (NSMutableArray *)galleryModelArr{
    if (!_galleryModelArr) {
        _galleryModelArr = [NSMutableArray array];
    }
    return _galleryModelArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createView];
    
    self.start = 0;
    [self createData];
}

#pragma mark - get data

- (void)createData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"c3a2c55eebe811e597b1525400097b5b" forHTTPHeaderField:@"HTTP-AUTHORIZATION"];
    [manager.requestSerializer setValue:@"mmmono.com" forHTTPHeaderField:@"Host"];
    [manager GET:[NSString stringWithFormat:URL_NEWFEEDS_GALLERY, self.start] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.galleryModelArr addObjectsFromArray:[VideoAndMusicModelArr getVideoAndMusicModelArr:responseObject]];
        self.start = [responseObject[@"start"] integerValue];
        [self.galleryView setGalleryModelArr:self.galleryModelArr];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - create view 

- (void)createView {
    self.galleryView = [[GalleryView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.galleryView];
    
    __block typeof(self) weakSelf = self;
    self.galleryView.tableView.tableViewRefreshBlock = ^{
        weakSelf.start = 0;
        [weakSelf.galleryModelArr removeAllObjects];
        [weakSelf createData];
    };
    self.galleryView.tableView.tableViewLoadMoreBlock = ^{
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
