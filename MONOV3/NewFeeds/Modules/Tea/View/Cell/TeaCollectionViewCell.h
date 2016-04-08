//
//  TeaCollectionViewCell.h
//  MONOV3
//
//  Created by JiangChile on 16/3/24.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@class TeaModel;

@interface TeaCollectionViewCell : BaseCollectionViewCell

@property (nonatomic, strong) TeaModel *model;

@end
