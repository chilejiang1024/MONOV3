//
//  MeowCellFactory.m
//  MONOV3
//
//  Created by JiangChile on 16/3/28.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "MeowCellFactory.h"

#import "MeowCellTypeZero.h"
#import "MeowCellTypeOne.h"
#import "MeowCellTypeTwo.h"
#import "MeowCellTypeThree.h"
#import "MeowCellTypeFour.h"
#import "MeowCellTypeFive.h"
#import "MeowCellTypeSix.h"
#import "MeowCellTypeSeven.h"
#import "MeowCellTypeEight.h"
#import "MeowCellTypeNine.h"

#import "BaseTableViewCell.h"

#import "Meow.h"

@interface MeowCellFactory ()

@property (nonatomic, strong) NSArray *arrayCells;
@property (nonatomic, strong) NSArray *arrayNibName;

@end

@implementation MeowCellFactory

- (NSArray *)arrayCells {
    if (!_arrayCells) {
        _arrayCells = @[[MeowCellTypeZero class], [MeowCellTypeOne class], [MeowCellTypeTwo class], [MeowCellTypeThree class], [MeowCellTypeFour class], [MeowCellTypeFive class], [MeowCellTypeSix class], [MeowCellTypeSeven class], [MeowCellTypeEight class], [MeowCellTypeNine class]];
    }
    return _arrayCells;
}

- (NSArray *)arrayNibName {
    if (!_arrayNibName) {
        _arrayNibName = @[@"MeowCellTypeZero", @"MeowCellTypeOne", @"MeowCellTypeTwo", @"MeowCellTypeThree", @"MeowCellTypeFour", @"MeowCellTypeFive", @"MeowCellTypeSix", @"MeowCellTypeSeven", @"MeowCellTypeEight", @"MeowCellTypeNine"];
    }
    return _arrayNibName;
}

+ (instancetype)manager {
    static MeowCellFactory *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [MeowCellFactory.alloc init];
    });
    return manager;
}

- (BaseTableViewCell *)createCellWithModel:(Meow *)model {
    @autoreleasepool {
        NSString *nibName = self.arrayNibName[model.meow_type.integerValue];
        BaseTableViewCell *cell = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil].lastObject;
        cell.model = model;
        return cell;
    }
}


@end
