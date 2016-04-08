//
//  Thumb.h
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"

@interface Thumb : BaseModel
@property (nonatomic, copy) NSString *raw;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger width;
@end
