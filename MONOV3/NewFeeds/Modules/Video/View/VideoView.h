//
//  VideoView.h
//  MONOV3
//
//  Created by JiangChile on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseView.h"

@interface VideoView : BaseView

@property (nonatomic, retain) BaseTableView *tableView;

- (void)setVideoModelArr:(NSMutableArray *)videoModelArr;

@end
