//
//  MusicView.m
//  MONOV3
//
//  Created by JiangChile on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "MusicView.h"

#import "BaseTableView.h"
#import "BaseTableViewCell.h"

#import "MONOTools.h"

#import "MeowCellFactory.h"

#import "MJRefresh.h"

@interface MusicView () <UITableViewDelegate, UITableViewDataSource>

/** data source */
@property (nonatomic, retain) NSMutableArray *musicModelArr;

@end


@implementation MusicView

#pragma mark - override setter method

- (void)setMusicModelArr:(NSMutableArray *)musicModelArr {
    _musicModelArr = musicModelArr;
    
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
    return self.musicModelArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MONOTools getHeightForCellWithMeowModel:self.musicModelArr[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Meow *meow = self.musicModelArr[indexPath.row];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@", meow.meow_type]];
    if (!cell) {
        cell = [[MeowCellFactory manager] createCellWithModel:self.musicModelArr[indexPath.row]];
    } else {
        cell.model = self.musicModelArr[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *url = [NSString stringWithFormat:URL_MEOW_WEBVIEW, [self.musicModelArr[indexPath.row] ID]];
    self.tableView.goToWebViewBlock(url);
}


@end
