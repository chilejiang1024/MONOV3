//
//  BaseTableView.m
//  MONOV3
//
//  Created by JiangChile on 16/3/23.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseTableView.h"

#import "MeowCellFactory.h"
#import "MeowCellTypeZero.h"
#import "MeowCellTypeOne.h"
#import "MeowCellTypeTwo.h"
#import "MeowCellTypeThree.h"
#import "MeowCellTypeFour.h"
#import "MeowCellTypeFive.h"
#import "MeowCellTypeSix.h"
#import "MeowCellTypeSeven.h"

#import "BaseWebView.h"

#import "MJRefresh.h"

@interface BaseTableView () <UITableViewDelegate>

/** meow item ID */
@property (nonatomic, retain) NSString *meowId;

@end

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.tableViewRefreshBlock();
        }];
        self.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            self.tableViewLoadMoreBlock();
        }];
    }
    return self;
}

- (GoToWebViewBlock)goToWebViewBlock {
    if (!_goToWebViewBlock) {
        _goToWebViewBlock = ^(NSString *url){
            BaseWebView *webView = [[BaseWebView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) URL:url];
            [[UIApplication sharedApplication].keyWindow addSubview:webView];
        };
    }
    return _goToWebViewBlock;
}

@end
