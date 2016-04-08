//
//  Collection.h
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseModel.h"
#import "Thumb.h"
@interface Collection : BaseModel
@property (nonatomic, retain) Thumb *thumb;
@property (nonatomic, copy) NSString *banner_img_url;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *fav_num;
@property (nonatomic, assign) BOOL is_program;
@property (nonatomic, copy) NSString *content_num;
@property (nonatomic, copy) NSString *logo_url;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *Id;
@end
