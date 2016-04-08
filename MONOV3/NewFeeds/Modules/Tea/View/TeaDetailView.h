//
//  TeaDetail.h
//  MONOV3
//
//  Created by JiangChile on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseView.h"

@class TeaDetailModel;

@interface TeaDetailView : BaseView

@property (nonatomic, strong) BaseTableView *tableView;

- (void)setTeaDetailModel:(TeaDetailModel *)teaDetailModel;

@end
