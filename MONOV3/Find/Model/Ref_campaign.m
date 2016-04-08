//
//  Ref_campaign.m
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "Ref_campaign.h"

@implementation Ref_campaign
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        self.thumb = [[Thumb alloc] initWithDic:[dic objectForKey:@"thumb"]];
        self.group_info = [[Group_info alloc] initWithDic:[dic objectForKey:@"group_infor"]];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.Id = value;
    }
    if ([key isEqualToString:@"description"]) {
        self.descriptionRef_campaign = value;
    }
}
@end
