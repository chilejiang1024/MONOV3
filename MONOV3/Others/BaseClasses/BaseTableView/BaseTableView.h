//
//  BaseTableView.h
//  MONOV3
//
//  Created by JiangChile on 16/3/23.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableView : UITableView

#warning mark - 这两个方法必须实现

typedef void(^TableViewRefreshBlock)();
/** TableViewRefreshBlock */
@property (nonatomic, copy) TableViewRefreshBlock tableViewRefreshBlock;

typedef void(^TableViewLoadMoreBlock)();
/** TableViewLoadMoreBlock */
@property (nonatomic, copy) TableViewLoadMoreBlock tableViewLoadMoreBlock;


#pragma mark - 跳转webview

typedef void(^GoToWebViewBlock)(NSString *url);
/** GoToWebViewBlock */
@property (nonatomic, copy) GoToWebViewBlock goToWebViewBlock;

@end
