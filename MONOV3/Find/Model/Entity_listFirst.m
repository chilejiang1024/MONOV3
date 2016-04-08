//
//  Entity_listFirst.m
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "Entity_listFirst.h"

@implementation Entity_listFirst
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
//        NSLog(@"%@", dic);
        self.meow = [[Meow alloc] initWithDic:[dic objectForKey:@"meow"]];
    }
    return self;
}

@end
