//
//  GalleryView.m
//  MONOV3
//
//  Created by JiangChile on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "GalleryView.h"

#import "BaseTableView.h"
#import "BaseTableViewCell.h"

#import "MONOTools.h"

#import "MeowCellFactory.h"

#import "MJRefresh.h"

@interface GalleryView () <UITableViewDataSource, UITableViewDelegate>

/** data source */
@property (nonatomic, retain) NSMutableArray *galleryModelArr;

@end


@implementation GalleryView

#pragma mark - override setter method

- (void)setGalleryModelArr:(NSMutableArray *)galleryModelArr {
    _galleryModelArr = galleryModelArr;
    
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
    return self.galleryModelArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MONOTools getHeightForCellWithMeowModel:self.galleryModelArr[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Meow *meow = self.galleryModelArr[indexPath.row];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@", meow.meow_type]];
    if (!cell) {
        cell = [[MeowCellFactory manager] createCellWithModel:self.galleryModelArr[indexPath.row]];
    } else {
        cell.model = self.galleryModelArr[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *url = [NSString stringWithFormat:URL_MEOW_WEBVIEW, [self.galleryModelArr[indexPath.row] ID]];
    self.tableView.goToWebViewBlock(url);
}

@end
