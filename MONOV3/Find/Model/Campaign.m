//
//  Campaign.m
//  MONOV3
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "Campaign.h"
#import "Recent_participant_infoModel.h"
@implementation Campaign

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        self.thumb = [[Thumb alloc] initWithDic:[dic objectForKey:@"thumb"]];
        self.group_info = [[Group_info alloc] initWithDic:[dic objectForKey:@"group_info"]];
        NSMutableArray *arrayTemp = self.recent_participant_info;
        self.recent_participant_info = [NSMutableArray array];
        for (NSDictionary *dicT in arrayTemp) {
            Recent_participant_infoModel *model = [[Recent_participant_infoModel alloc] initWithDic:dicT];
            [self.recent_participant_info addObject:model];
        }
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
