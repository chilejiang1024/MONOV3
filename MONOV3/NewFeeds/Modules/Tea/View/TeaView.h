//
//  TeaView.h
//  MONOV3
//
//  Created by JiangChile on 16/3/24.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseView.h"

@class BaseCollectionView;

@interface TeaView : BaseView

/** collectionView */
@property (nonatomic, strong) BaseCollectionView *collectionView;

typedef void(^GoToTeaDetailViewBlock)(NSInteger teaId);
/** GoToTeaDetailViewBlock */
@property (nonatomic, copy) GoToTeaDetailViewBlock goToTeaDetailViewBlock;


- (void)setArrayTeaHistory:(NSMutableArray *)arrayTeaHistory;

@end
