//
//  TeaModel.m
//  MONOV3
//
//  Created by JiangChile on 16/3/24.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "TeaModel.h"

@implementation TeaModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        _teaId = [value integerValue];
    }
}

+ (NSMutableArray *)getTeaModelArrayWithArray:(NSArray *)array {
    NSMutableArray *result = @[].mutableCopy;
    for (NSDictionary *dic in array) {
        TeaModel *model = [TeaModel.alloc initWithDic:dic];
        [result addObject:model];
    }
    return result;
}

@end
