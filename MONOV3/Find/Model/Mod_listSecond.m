//
//  Mod_listSecond.m
//  MONOV3
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "Mod_listSecond.h"
#import "Group.h"
#import "Collection.h"
#import "Campaign.h"
@implementation Mod_listSecond

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        NSMutableArray *arrTemp = self.entity_list;
        self.entity_list = [NSMutableArray array];
        for (NSDictionary *dicT in arrTemp) {
            NSString *key = dicT.allKeys.firstObject;
            if ([key isEqualToString:@"group"]) {
                Group *group = [[Group alloc] initWithDic:[dicT objectForKey:@"group"]];
//                NSLog(@"%@", group.status);
                [self.entity_list addObject:group];
            } else if ([key isEqualToString:@"campaign"]) {
                Campaign *campaign = [[Campaign alloc] initWithDic:[dicT objectForKey:@"campaign"]];
                [self.entity_list addObject:campaign];
            } else if ([key isEqualToString:@"collection"]) {
                Collection *collection = [[Collection alloc] initWithDic:[dicT objectForKey:@"collect"]];
                [self.entity_list addObject:collection];
            }
        }
    }
    return self;
}

@end
