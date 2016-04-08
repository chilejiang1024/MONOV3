//
//  FindCollectionViewCell.m
//  MONOV3
//
//  Created by JiangChile on 16/3/23.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "FindCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation FindCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createCell];
    }
    return self;
}

- (void)createCell {
    // 图片背景创建
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH / 2, WIDTH / 2)];
//    self.backgroundColor = COLOR_RANDOM;
    [self.contentView addSubview:self.imgView];
    
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH / 2, WIDTH / 2)];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha= 0.5;
    [self.imgView addSubview:blackView];
    
    // title创建
    self.labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10 * W, 10 * H, 140 * W, 40 * H)];
//    self.labelTitle.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.labelTitle];
    
    // 类型创建
    self.labelType = [[UILabel alloc] initWithFrame:CGRectMake(10 * W, 60 * H, 100 * W, 20 * H)];
//    self.labelType.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.labelType];
    
    // 内容创建
    self.labelContent = [[UILabel alloc] initWithFrame:CGRectMake(10 * W, 130 * H, WIDTH / 2 - 20 * W, 40 * H)];
//    self.labelContent.backgroundColor = [UIColor whiteColor];
    self.labelContent.numberOfLines = 0;
    [self.contentView addSubview:self.labelContent];
    
    // 评论人数创建
    self.labelCount = [[UILabel alloc] initWithFrame:CGRectMake(10 * W, 180 * H, 100 * W, 20 * H)];
//    self.labelCount.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.labelCount];
    
    // 热门推荐创建
    self.labelHot = [[UILabel alloc] initWithFrame:CGRectMake(140 * W, 180 * H, 60 * W, 20 * H)];
//    self.labelHot.backgroundColor = [UIColor whiteColor];
    self.labelHot.text = @"热门推荐";
    self.labelHot.font = [UIFont systemFontOfSize:12];
    self.labelHot.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.labelHot];
    
    // 头像创建
    self.imageViewUser = [[UIImageView alloc] initWithFrame:CGRectMake(160 * W, 10 * H, 40 * W, 40 * H)];
//    self.imageViewUser.backgroundColor = [UIColor redColor];
    self.imageViewUser.layer.cornerRadius = 20 * W;
    self.imageViewUser.clipsToBounds = YES;
    [self.contentView addSubview:self.imageViewUser];
}
- (void)setModel:(Group *)model {
    // 图片赋值
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.thumb.raw] placeholderImage:[UIImage imageNamed:@"mask-gallery.png"]];
    
    // title赋值
    self.labelTitle.text = model.name;
    self.labelTitle.font = [UIFont systemFontOfSize:20];
    self.labelTitle.textColor = [UIColor whiteColor];
    
    // 内容赋值
    self.labelContent.text = model.descriptionGroup;
    self.labelContent.font = [UIFont systemFontOfSize:13];
    self.labelContent.textColor = [UIColor whiteColor];
    
    // 人数赋值
    NSString *str = @"人";
    NSString *strr = [NSString stringWithFormat:@"%ld%@", model.member_num, str];
    self.labelCount.text = strr;
    self.labelCount.font = [UIFont systemFontOfSize:12];
    self.labelCount.textColor = [UIColor whiteColor];
    
    // 类型赋值
    if (model.cert_kind_id == 1) {
        self.labelType.text = @"MONO造物主";
        self.labelType.textColor = MONO_COLOR;
    } else if (model.cert_kind_id == 0) {
        self.labelType.text = @"内容站";
        self.labelType.textColor = [UIColor grayColor];
    }
    self.labelType.font = [UIFont systemFontOfSize:14];
    
    // 头像赋值
    [self.imageViewUser sd_setImageWithURL:[NSURL URLWithString:model.logo_url] placeholderImage:[UIImage imageNamed:@"mask-gallery.png"]];
    
}
@end
