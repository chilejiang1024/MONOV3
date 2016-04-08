//
//  FindModel.m
//  MONOV3
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "FindModel.h"

@implementation FindModel

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        self.top_banner = [[Top_banner alloc] initWithDic:[dic objectForKey:@"top_banner"]];
        NSMutableArray *arrayTemp = self.mod_list;
        self.mod_list = [NSMutableArray array];
        for (NSDictionary *dicT in arrayTemp) {
            Mod_list *mod = [[Mod_list alloc] initWithDic:dicT];
            [self.mod_list addObject:mod];
        }
    }
    return self;
}

+ (instancetype)findModelWithDic:(NSDictionary *)dic{
    FindModel *model = [[FindModel alloc] initWithDic:dic];
    return model;
}

@end
