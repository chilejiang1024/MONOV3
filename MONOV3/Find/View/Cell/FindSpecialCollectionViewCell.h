//
//  FindSpecialCollectionViewCell.h
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "Collection.h"

@interface FindSpecialCollectionViewCell : BaseCollectionViewCell

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelType;
@property (nonatomic, strong) UILabel *labelCollect;
@property (nonatomic, strong) UILabel *labelContent;

@property (nonatomic, strong) Collection *model;

@end
