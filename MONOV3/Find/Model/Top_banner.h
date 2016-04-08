//
//  Top_banner.h
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"
#import "Entity_listFirst.h"
#import "Entity_listSecond.h"
@interface Top_banner : BaseModel
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSMutableArray *entity_list;
@end
