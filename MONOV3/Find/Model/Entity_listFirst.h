//
//  Entity_listFirst.h
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"
#import "Meow.h"
@interface Entity_listFirst : BaseModel
@property (nonatomic, retain) Meow *meow;
@property (nonatomic, copy) NSString *begin;
@property (nonatomic, copy) NSString *banner_img_url;

@end
