//
//  TagsModel.m
//  MONOV3
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "TagsModel.h"

@implementation TagsModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.Id = value;
    }
}
+ (NSMutableArray *)getTagsModelArray:(NSDictionary *)dictionary{
    NSMutableArray *array = [NSMutableArray array];
    NSArray *arrayTags = [dictionary objectForKey:@"tags"];
    for (NSDictionary *dicTemp in arrayTags) {
        TagsModel *model = [[TagsModel alloc] initWithDic:dicTemp];
        [array addObject:model];
    }
    return array;
}
@end
