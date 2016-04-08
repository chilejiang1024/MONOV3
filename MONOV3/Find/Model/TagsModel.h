//
//  TagsModel.h
//  MONOV3
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"

@interface TagsModel : BaseModel
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *name;
+ (NSMutableArray *)getTagsModelArray:(NSDictionary *)dictionary;
@end
