//
//  NewFeedsCollectionViewCell.m
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "NewFeedsCollectionViewCell.h"

#import "ExploreViewController.h"
#import "FollowingViewController.h"
#import "GalleryViewController.h"
#import "MusicViewController.h"
#import "TeaViewController.h"
#import "VideoViewController.h"


@interface NewFeedsCollectionViewCell ()

@property (nonatomic, strong) NSArray *feedsVCClasses;

@end


@implementation NewFeedsCollectionViewCell

- (NSArray *)feedsVCClasses {
    if (!_feedsVCClasses) {
        _feedsVCClasses = @[[ExploreViewController class], [FollowingViewController class], [VideoViewController class], [MusicViewController class], [GalleryViewController class], [TeaViewController class]];
    }
    return _feedsVCClasses;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)setNewFeedsCollectionViewCellType:(NewFeedsCollectionViewCellType)newFeedsCollectionViewCellType {
    if (self.contentView.subviews.count == 0) {
        [self createExploreVCWithType:newFeedsCollectionViewCellType];
    }
}

- (void)createExploreVCWithType:(NewFeedsCollectionViewCellType)type {
    BaseViewController *vc = [[self.feedsVCClasses[type] alloc] init];
    vc.view.frame = self.contentView.frame;
    [self.contentView addSubview:vc.view];
}

@end
