//
//  FindSpecialCollectionViewCell.m
//  MONOV3
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "FindSpecialCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation FindSpecialCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSpecialCell];
    }
    return self;
}

- (void)createSpecialCell {
    // 图片背景创建
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH / 2, WIDTH / 2)];
        self.backgroundColor = COLOR_RANDOM;
    [self.contentView addSubview:self.imgView];
    
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH / 2, WIDTH / 2)];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha= 0.5;
    [self.imgView addSubview:blackView];
    
    // title创建
    self.labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(20 * W, 50 * H, WIDTH / 2 - 40 * W, 50 * H)];
//    self.labelTitle.backgroundColor = [UIColor whiteColor];
    self.labelTitle.textAlignment = NSTextAlignmentCenter;
    self.labelTitle.font = [UIFont systemFontOfSize:20];
    self.labelTitle.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.labelTitle];
    
    // 类型
    self.labelType = [[UILabel alloc] initWithFrame:CGRectMake(50 * W, 140 * H, WIDTH / 2 - 100 * W, 20 * H)];
//    self.labelType.backgroundColor = [UIColor whiteColor];
    self.labelType.font = [UIFont systemFontOfSize:14];
    self.labelType.textAlignment = NSTextAlignmentCenter;
    self.labelType.textColor = [UIColor colorWithRed:1 green:0.86 blue:0.38 alpha:1.0];
    [self.contentView addSubview:self.labelType];
    
    // 收藏数
    self.labelCollect = [[UILabel alloc] initWithFrame:CGRectMake(30 * W, 170 * H, 70 * W, 20 * H)];
//    self.labelCollect.backgroundColor = [UIColor whiteColor];
    self.labelCollect.font = [UIFont systemFontOfSize:12];
    self.labelCollect.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.labelCollect];
    
    // 内容数
    self.labelContent = [[UILabel alloc] initWithFrame:CGRectMake(110 * W, 170 * H, 70 * W, 20 * H)];
//    self.labelContent.backgroundColor = [UIColor whiteColor];
    self.labelContent.font = [UIFont systemFontOfSize:12];
    self.labelContent.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.labelContent];
}
- (void)setModel:(Collection *)model {
    // 图片赋值
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.thumb.raw] placeholderImage:[UIImage imageNamed:@"mask-gallery.png"]];
    
    // 题目赋值
    self.labelTitle.text = model.title;
    
    // 类型赋值
    self.labelType.text = @"MONO专题";
    
    // 收藏人数赋值
    self.labelCollect.text = [NSString stringWithFormat:@"%@%@", model.fav_num, @"人收藏"];
    
    // 内容数赋值
    self.labelContent.text = [NSString stringWithFormat:@"%@%@", model.content_num, @"篇内容"];
    
}

@end
