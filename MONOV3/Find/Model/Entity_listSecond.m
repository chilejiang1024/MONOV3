//
//  Entity_listSecond.m
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "Entity_listSecond.h"

@implementation Entity_listSecond
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        self.collection = [[Collection alloc] initWithDic:[dic objectForKey:@"collection"]];
    }
    return self;
}
@end
