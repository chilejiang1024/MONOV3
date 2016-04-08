//
//  Recent_participant_infoModel.m
//  MONOV3
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "Recent_participant_infoModel.h"

@implementation Recent_participant_infoModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        self.coordinate = [[Coordinate alloc] initWithDic:[dic objectForKey:@"coordinate"]];
    }
    return self;
}
@end
