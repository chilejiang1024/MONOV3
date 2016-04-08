//
//  BlackTableviewCell.h
//  MONOV3
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "Group.h"
@interface BlackTableviewCell : BaseTableViewCell

@property (nonatomic, strong) UIImageView *imgViewUser;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelDescribe;
@property (nonatomic, strong) UILabel *labelContentCount;
@property (nonatomic, strong) UILabel *labelMemberCount;

@property (nonatomic, strong) Group *groupModel;

@end
