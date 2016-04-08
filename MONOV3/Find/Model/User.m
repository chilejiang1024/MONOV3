//
//  User.m
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "User.h"

@implementation User
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        self.coordinate = [[Coordinate alloc] initWithDic:dic[@"coordinate"]];
    }
    return self;
}
@end
