//
//  NewFeedsCollectionViewCell.h
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseCollectionViewCell.h"


typedef enum : NSUInteger {
    NewFeedsCollectionViewCellTypeExplore,
    NewFeedsCollectionViewCellTypeFollowing,
    NewFeedsCollectionViewCellTypeVideo,
    NewFeedsCollectionViewCellTypeMusic,
    NewFeedsCollectionViewCellTypeGallery,
    NewFeedsCollectionViewCellTypeTea
} NewFeedsCollectionViewCellType;

@interface NewFeedsCollectionViewCell : BaseCollectionViewCell

@property (nonatomic, assign) NewFeedsCollectionViewCellType newFeedsCollectionViewCellType;

@end
