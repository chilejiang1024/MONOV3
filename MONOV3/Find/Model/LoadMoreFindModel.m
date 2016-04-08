//
//  LoadMoreFindModel.m
//  MONOV3
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "LoadMoreFindModel.h"

@implementation LoadMoreFindModel

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        NSMutableArray *arrTemp = self.mod_list;
        self.mod_list = [NSMutableArray array];
        for (NSDictionary *dicT in arrTemp) {
            Mod_listSecond *model = [[Mod_listSecond alloc] initWithDic:dicT];
            [self.mod_list addObject:model];
        }
    }
    return self;
}



- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
