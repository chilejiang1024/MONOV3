//
//  Group.m
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "Group.h"

@implementation Group
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        self.thumb = [[Thumb alloc] initWithDic:[dic objectForKey:@"thumb"]];
        self.master_info = [[Master_info alloc] initWithDic:[dic objectForKey:@"master_info"]];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        self.descriptionGroup = value;
    }
}
@end
