//
//  MusicView.h
//  MONOV3
//
//  Created by JiangChile on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseView.h"

@interface MusicView : BaseView

@property (nonatomic, retain) BaseTableView *tableView;

- (void)setMusicModelArr:(NSMutableArray *)musicModelArr;

@end
