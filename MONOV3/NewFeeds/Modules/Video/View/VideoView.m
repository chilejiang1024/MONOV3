//
//  VideoView.m
//  MONOV3
//
//  Created by JiangChile on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "VideoView.h"

#import "BaseTableView.h"
#import "BaseTableViewCell.h"

#import "MONOTools.h"

#import "MeowCellFactory.h"

#import "MJRefresh.h"

@interface VideoView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray *videoModelArr;

@end


@implementation VideoView

#pragma mark - override setter method

- (void)setVideoModelArr:(NSMutableArray *)videoModelArr {
    _videoModelArr = videoModelArr;
    
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - init & create view & table view

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self createTableView];
}

- (void)createTableView {
    BaseTableView *tableView = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 70) style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
    self.tableView = tableView;
    [self addSubview:self.tableView];
}

#pragma mark - table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoModelArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MONOTools getHeightForCellWithMeowModel:self.videoModelArr[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Meow *meow = self.videoModelArr[indexPath.row];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@", meow.meow_type]];
    if (!cell) {
        cell = [[MeowCellFactory manager] createCellWithModel:self.videoModelArr[indexPath.row]];
    } else {
        cell.model = self.videoModelArr[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *url = [NSString stringWithFormat:URL_MEOW_WEBVIEW, [self.videoModelArr[indexPath.row] ID]];
    self.tableView.goToWebViewBlock(url);
}

@end
