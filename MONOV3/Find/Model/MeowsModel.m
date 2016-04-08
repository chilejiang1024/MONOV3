//
//  MeowsModel.m
//  MONOV3
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "MeowsModel.h"

@implementation MeowsModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        self.thumb = [[Thumb alloc] initWithDic:[dic objectForKey:@"thumb"]];
        self.user = [[User alloc] initWithDic:[dic objectForKey:@"user"]];
        self.category = [[CategoryModel alloc] initWithDic:[dic objectForKey:@"categorey"]];
        self.group = [[Group alloc] initWithDic:[dic objectForKey:@"group"]];
        NSMutableArray *array = self.pics;
        self.pics = [NSMutableArray array];
        for (NSDictionary *dictionary in array) {
            Thumb *category = [[Thumb alloc] initWithDic:dictionary];
            [self.pics addObject:category];
        }
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.Id = value;
    }
    if ([key isEqualToString:@"description"]) {
        self.descriptionMeows = value;
    }
}
+ (NSMutableArray *)getMeowsModelArray:(NSDictionary *)dictionary{
    NSMutableArray *array = [NSMutableArray array];
    NSArray *arrayTemp = [dictionary objectForKey:@"meows"];
    for (NSDictionary *dicMeows in arrayTemp) {
        NSDictionary *dicTemp = [dicMeows objectForKey:@"meow"];
        MeowsModel *model = [[MeowsModel alloc] initWithDic:dicTemp];
        [array addObject:model];
    }
    return array;
}

@end
