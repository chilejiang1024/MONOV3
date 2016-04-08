//
//  Group_info.h
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"
#import "Thumb.h"
#import "Master_info.h"
@interface Group_info : BaseModel
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *kind;
@property (nonatomic, copy) NSString *topic_content_num;
@property (nonatomic, copy) NSString *slogan;
@property (nonatomic, copy) NSString *descriptionGroupInfor;
@property (nonatomic, copy) NSString *discuss_content_num;
@property (nonatomic, retain) NSMutableArray *admin_list;
@property (nonatomic, retain) Thumb *thumb;
@property (nonatomic, retain) Master_info *master_info;
@property (nonatomic, copy) NSString *member_num;
@property (nonatomic, copy) NSString *publisher_type;
@property (nonatomic, copy) NSString *campaign_num;
@property (nonatomic, copy) NSString *cert_kind_id;
@property (nonatomic, copy) NSString *logo_url;
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *name;
@end
