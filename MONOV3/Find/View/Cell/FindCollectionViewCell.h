//
//  FindCollectionViewCell.h
//  MONOV3
//
//  Created by JiangChile on 16/3/23.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "Group.h"

@interface FindCollectionViewCell : BaseCollectionViewCell

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelType;
@property (nonatomic, strong) UILabel *labelContent;
@property (nonatomic, strong) UILabel *labelCount;
@property (nonatomic, strong) UILabel *labelHot;
@property (nonatomic, strong) UIImageView *imageViewUser;

@property (nonatomic, strong) Group *model;

@end
