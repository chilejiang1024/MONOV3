//
//  Top_banner.m
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "Top_banner.h"
@implementation Top_banner

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        NSMutableArray *array = self.entity_list;
        self.entity_list = [NSMutableArray array];
        self.entity_list[0] = [[Entity_listFirst alloc] initWithDic:array[0]];
        self.entity_list[1] = [[Entity_listSecond alloc] initWithDic:array[1]];
        self.entity_list[2] = [[Entity_listSecond alloc] initWithDic:array[2]];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.Id = value;
    }
}
@end
