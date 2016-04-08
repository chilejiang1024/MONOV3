//
//  ExploreView.m
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "ExploreView.h"

#import "Meow.h"

#import "MeowCellFactory.h"

#import "BaseTableViewCell.h"

#import "MONOTools.h"
#import "MJRefresh.h"

@interface ExploreView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray *exploreModelArr;

@end

@implementation ExploreView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}

- (void)setExploreModelArr:(NSMutableArray *)exploreModelArr {
    _exploreModelArr = exploreModelArr;
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exploreModelArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MONOTools getHeightForCellWithMeowModel:self.exploreModelArr[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Meow *meow = self.exploreModelArr[indexPath.row];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@", meow.meow_type]];
    if (!cell) {
        cell = [[MeowCellFactory manager] createCellWithModel:self.exploreModelArr[indexPath.row]];
    } else {
        cell.model = self.exploreModelArr[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *url = [NSString stringWithFormat:URL_MEOW_WEBVIEW, [self.exploreModelArr[indexPath.row] ID]];
    self.tableView.goToWebViewBlock(url);
}


@end
