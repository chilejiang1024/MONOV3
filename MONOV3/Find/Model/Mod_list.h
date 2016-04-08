//
//  Mod_list.h
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"

@interface Mod_list : BaseModel
@property (nonatomic, retain) NSMutableArray *entity_list;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *name;

@end