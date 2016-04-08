//
//  BaseCollectionView.m
//  MONOV3
//
//  Created by JiangChile on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.collectionViewRefreshBlock();
        }];
        self.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            self.collectionViewLoadMoreBlock();
        }];
    }
    return self;
}

@end
