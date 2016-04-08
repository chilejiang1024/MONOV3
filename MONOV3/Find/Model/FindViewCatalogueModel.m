//
//  FindViewCatalogueModel.m
//  MONOV3
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "FindViewCatalogueModel.h"
#import "AFNetworking.h"

@implementation FindViewCatalogueModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.Id = value;
    }
}

+ (void)getFindViewCatalogueModel:(FindViewCatalogueModelBlock)block{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://mmmono.com/api/v3/domain_category/" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray *array = [NSMutableArray array];
        
        NSArray *arrayResponseObject = [responseObject objectForKey:@"category_list"];
        
        for (NSDictionary *dicT in arrayResponseObject) {
            
            FindViewCatalogueModel *model = [[FindViewCatalogueModel alloc] initWithDic:dicT];
            
            [array addObject:model];
        }
        
        block(array);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end
