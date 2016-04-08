//
//  ExPloreModelArr.m
//  MONOV3
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "ExPloreModelArr.h"

@implementation ExPloreModelArr

+ (NSMutableArray *)getExPloreModelArray:(NSDictionary *)dictionary{
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *entity_list = [dictionary objectForKey:@"entity_list"];
    for (int i = 0; i < entity_list.count; i++) {
        Meow *meow = [[Meow alloc] initWithDic:[entity_list[i] objectForKey:@"meow"]];
        [array addObject:meow];
    }
    return array;
}

@end
