//
//  Meow.m
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "Meow.h"

@implementation Meow

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super initWithDic:dic];
    if (self) {
        self.group         = [[Group alloc] initWithDic:[dic objectForKey:@"group"]];
        self.ref_campaign  = [[Ref_campaign alloc] initWithDic:[dic objectForKey:@"ref_campaign"]];
        self.thumb         = [Thumb.alloc initWithDic:dic[@"thumb"]];
        self.user          = [[User alloc] initWithDic:[dic objectForKey:@"user"]];
        self.categoryModel = [[CategoryModel alloc] initWithDic:dic[@"category"]];
        if (dic[@"images"]) {
            self.images = @[].mutableCopy;
            for (NSDictionary *dicTemp in dic[@"images"]) {
                [self.images addObject:[[Thumb alloc] initWithDic:dicTemp]];
            }
        }
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    } else if ([key isEqualToString:@"description"]) {
        _meowDescription = value;
    }
}

@end
