//
//  BaseTableViewCell.h
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Meow.h"

#import "UIImageView+WebCache.h"

@interface BaseTableViewCell : UITableViewCell

@property (nonatomic, strong) Meow *model;

/** 设置并创建cell下方按钮view, 0 black, 1 white */
- (void)setControlPanelViewStyle:(NSInteger)controlPanelViewStyle ThumbNum:(NSInteger)thumbNum CommentNum:(NSInteger)commentNum;

@end
