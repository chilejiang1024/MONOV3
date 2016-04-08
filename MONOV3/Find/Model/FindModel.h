//
//  FindModel.h
//  MONOV3
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"
#import "Top_banner.h"
#import "Mod_list.h"

@interface FindModel : BaseModel

@property (nonatomic, copy) NSString *start;
@property (nonatomic, assign) BOOL is_last_page;
@property (nonatomic, retain) Top_banner *top_banner;
@property (nonatomic, retain) NSMutableArray *mod_list;

+ (instancetype)findModelWithDic:(NSDictionary *)dic;

@end
