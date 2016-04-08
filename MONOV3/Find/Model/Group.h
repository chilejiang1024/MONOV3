//
//  Group.h
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"
#import "Thumb.h"
#import "Master_info.h"
@interface Group : BaseModel
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *kind;
@property (nonatomic, assign) NSInteger topic_content_num;
@property (nonatomic, copy) NSString *slogan;
@property (nonatomic, copy) NSString *descriptionGroup;
@property (nonatomic, assign) NSInteger discuss_content_num;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSMutableArray *admin_list;
@property (nonatomic, retain) Master_info *master_info;
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *publisher_type;
@property (nonatomic, copy) NSString *campaign_num;
@property (nonatomic, assign) NSInteger cert_kind_id;
@property (nonatomic, copy) NSString *logo_url;
@property (nonatomic, assign) NSInteger member_num;
@property (nonatomic, retain) Thumb *thumb;
@end
