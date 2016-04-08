//
//  VideoAndMusicModelArr.m
//  MONOV3
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "VideoAndMusicModelArr.h"
#import "Meow.h"

@implementation VideoAndMusicModelArr

+ (NSMutableArray *)getVideoAndMusicModelArr:(NSDictionary *)dictionary{
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *arrMeow = [dictionary objectForKey:@"meows"];
    for (NSDictionary *meowDic in arrMeow) {
        Meow *meow = [[Meow alloc] initWithDic:meowDic];
        [array addObject:meow];
    }
    return array;
}

@end
