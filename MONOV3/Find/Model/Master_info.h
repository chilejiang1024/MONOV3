//
//  Master_info.h
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"
#import "Coordinate.h"
@interface Master_info : BaseModel
@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *is_anonymous;
@property (nonatomic, copy) NSString *horoscope;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *self_description;
@property (nonatomic, copy) NSString *avatar_url;
@property (nonatomic, retain) Coordinate *coordinate;
@end
