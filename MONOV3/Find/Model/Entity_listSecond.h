//
//  Entity_listSecond.h
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"
#import "Collection.h"
@interface Entity_listSecond : BaseModel
@property (nonatomic, copy) NSString *begin;
@property (nonatomic, retain) Collection *collection;
@property (nonatomic, copy) NSString *banner_img_url;
@end
