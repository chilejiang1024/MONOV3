//
//  TeaDetailModel.m
//  MONOV3
//
//  Created by JiangChile on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "TeaDetailModel.h"

@implementation TeaDetailModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super initWithDic:dic]) {
        self.entity_list = @[].mutableCopy;
        for (NSDictionary *dicTemp in dic[@"entity_list"]) {
            [self.entity_list addObject:[Meow.alloc initWithDic:dicTemp[@"meow"]]];
        }
    }
    return self;
}

+ (TeaDetailModel *)getTeaDetailModelWithDic:(NSDictionary *)dic {
    return [TeaDetailModel.alloc initWithDic:dic];
}

@end
