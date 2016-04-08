//
//  MeowsModel.h
//  MONOV3
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"
#import "Meow.h"
#import "Group.h"
#import "Thumb.h"
#import "User.h"
#import "CategoryModel.h"
@interface MeowsModel : BaseModel
@property (nonatomic, copy) NSString *bang_count;
@property (nonatomic, assign) BOOL is_folded;
@property (nonatomic, copy) NSString *kind;
@property (nonatomic, retain) Group *group;
@property (nonatomic, copy) NSString *descriptionMeows;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *meow_status;
@property (nonatomic, retain) NSMutableArray *pics;
@property (nonatomic, copy) NSString *has_video;
@property (nonatomic, assign) BOOL is_post_by_master;
@property (nonatomic, copy) NSString *comment_count;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, retain) User *user;
@property (nonatomic, copy) NSString *meow_type;
@property (nonatomic, retain) CategoryModel *category;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, retain) Thumb *thumb;
+ (NSMutableArray *)getMeowsModelArray:(NSDictionary *)dictionary;
@end
