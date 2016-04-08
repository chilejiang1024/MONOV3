//
//  Ref_campaign.h
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"
#import "Group_info.h"
#import "Thumb.h"
@interface Ref_campaign : BaseModel
@property (nonatomic, retain) Group_info *group_info;
@property (nonatomic, copy) NSString *slogan;
@property (nonatomic, copy) NSString *descriptionRef_campaign;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *rules;
@property (nonatomic, copy) NSString *publisher_type;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *participant_num;
@property (nonatomic, copy) NSString *content_num;
@property (nonatomic, retain) NSMutableArray *recent_participant_info;
@property (nonatomic, copy) NSString *logo_url;
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, retain) Thumb *thumb;
@end
