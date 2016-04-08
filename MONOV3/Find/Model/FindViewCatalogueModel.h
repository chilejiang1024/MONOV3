//
//  FindViewCatalogueModel.h
//  MONOV3
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"

typedef void(^FindViewCatalogueModelBlock)(NSMutableArray *array);

@interface FindViewCatalogueModel : BaseModel
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *name;
+ (void)getFindViewCatalogueModel:(FindViewCatalogueModelBlock)block;
@end
