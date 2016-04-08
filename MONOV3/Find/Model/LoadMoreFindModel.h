//
//  LoadMoreFindModel.h
//  MONOV3
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"
#import "Mod_listSecond.h"
@interface LoadMoreFindModel : BaseModel
@property (nonatomic, copy) NSString *start;
@property (nonatomic, retain) NSMutableArray *mod_list;
@end
