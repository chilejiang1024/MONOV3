//
//  BaseCollectionView.h
//  MONOV3
//
//  Created by JiangChile on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MJRefresh.h"

@interface BaseCollectionView : UICollectionView

#warning mark - 所有继承, 必须实现以下两个block
typedef void(^CollectionViewRefreshBlock)();
/** RefreshBlock */
@property (nonatomic, copy) CollectionViewRefreshBlock collectionViewRefreshBlock;

typedef void(^CollectionViewLoadMoreBlock)();
/** LoadMoreBlock */
@property (nonatomic, copy) CollectionViewLoadMoreBlock collectionViewLoadMoreBlock;


@end
