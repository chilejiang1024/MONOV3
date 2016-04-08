//
//  Master_info.m
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "Master_info.h"

@implementation Master_info
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        self.coordinate = [[Coordinate alloc] initWithDic:[dic objectForKey:@"coordinate"]];
    }
    return self;
}
@end
