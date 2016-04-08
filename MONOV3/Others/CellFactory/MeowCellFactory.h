//
//  MeowCellFactory.h
//  MONOV3
//
//  Created by JiangChile on 16/3/28.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseTableViewCell;
@class Meow;

@interface MeowCellFactory : NSObject

+ (instancetype)manager;

- (BaseTableViewCell *)createCellWithModel:(Meow *)model;

@end
