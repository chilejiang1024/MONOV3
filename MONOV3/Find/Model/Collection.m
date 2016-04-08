//
//  Collection.m
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "Collection.h"

@implementation Collection
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        self.thumb = [[Thumb alloc] initWithDic:dic[@"thumb"]];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.Id = value;
    }
}
@end
