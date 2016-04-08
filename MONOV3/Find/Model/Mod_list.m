//
//  Mod_list.m
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "Mod_list.h"
#import "Collection.h"
#import "Group.h"
#import "Entity_listFirst.h"
@implementation Mod_list
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        NSMutableArray *arrTemp = self.entity_list;
        self.entity_list = [NSMutableArray array];
        for (NSDictionary *dicT in arrTemp) {
            if (dicT.allKeys.count > 1) {
                Entity_listFirst *entity = [[Entity_listFirst alloc] initWithDic:dicT];
                [self.entity_list addObject:entity];
            } else {
            NSString *key = dicT.allKeys.firstObject;
//            NSLog(@"%@", key);
            if ([key isEqualToString:@"group"]) {
                Group *group = [[Group alloc] initWithDic:dicT[@"group"]];
                [self.entity_list addObject:group];
            } else if ([key isEqualToString:@"meow"]) {
                Meow *meow = [[Meow alloc] initWithDic:dicT[@"meow"]];
                [self.entity_list addObject:meow];
            } else if ([key isEqualToString:@"collection"]) {
                Collection *collection = [[Collection alloc] initWithDic:dicT[@"collection"]];
//                NSLog(@"%@", collection.title); 
                [self.entity_list addObject:collection];
                }
            }
        }
    }
    return self;
}
@end
