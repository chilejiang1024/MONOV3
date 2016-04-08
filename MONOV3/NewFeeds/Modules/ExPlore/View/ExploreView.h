//
//  ExploreView.h
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseView.h"

@interface ExploreView : BaseView

@property (nonatomic, retain) BaseTableView *tableView;

- (void)setExploreModelArr:(NSMutableArray *)exploreModelArr;

@end
