//
//  Meow.h
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "User.h"
#import "Group.h"
#import "Thumb.h"
#import "BaseModel.h"
#import "Ref_campaign.h"
#import "CategoryModel.h"

@interface Meow : BaseModel

@property (nonatomic, copy) NSString *bang_count;
@property (nonatomic, assign) BOOL is_folded;
@property (nonatomic, copy) NSString *kind;
@property (nonatomic, retain) Group *group;
@property (nonatomic, retain) Thumb *thumb;
@property (nonatomic, retain) Ref_campaign *ref_campaign;
@property (nonatomic, copy) NSString *meow_status;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *comment_count;
@property (nonatomic, assign) NSInteger create_time;
@property (nonatomic, retain) User *user;
@property (nonatomic, copy) NSString *meow_type;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *meowDescription;
@property (nonatomic, copy) NSString *is_post_by_master;
@property (nonatomic, retain) CategoryModel *categoryModel;

/**
 *  music
 */
@property (nonatomic, copy) NSString *song_name;
@property (nonatomic, copy) NSString *music_url;
@property (nonatomic, copy) NSString *music_duration;

/**
 *  gallery
 */
@property (nonatomic, retain) NSMutableArray *images;


@end
