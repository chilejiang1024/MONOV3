//
//  BlackTableviewCell.m
//  MONOV3
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BlackTableviewCell.h"

@implementation BlackTableviewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createCell];
    }
    return self;
}
- (void)createCell {
    // 头像创建
    self.imgViewUser = [[UIImageView alloc] initWithFrame:CGRectMake(10 * W, 10 * H, 50 * W, 50 * H)];
    self.imgViewUser.backgroundColor = [UIColor purpleColor];
    self.imgViewUser.layer.cornerRadius = 25 * W;
    self.imgViewUser.clipsToBounds = YES;
    [self.contentView addSubview:self.imgViewUser];
    
    // 题目创建
    self.labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(70 * W, 5 * H, 200 * W, 20 * H)];
//    self.labelTitle.backgroundColor = [UIColor purpleColor];
    self.labelTitle.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:self.labelTitle];
    
    // 描述内容创建
    self.labelDescribe = [[UILabel alloc] initWithFrame:CGRectMake(70 * W, 30 * H, 300 * W, 20 * H)];
//    self.labelDescribe.backgroundColor = [UIColor yellowColor];
    self.labelDescribe.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.labelDescribe];
    
    // 内容数和成员数
    self.labelContentCount = [[UILabel alloc] initWithFrame:CGRectMake(70 * W, 55 * H, 200 * W, 10 * H)];
//    self.labelContentCount.backgroundColor = [UIColor redColor];
    self.labelContentCount.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.labelContentCount];
    
}

- (void)setGroupModel:(Group *)groupModel {
    _groupModel = groupModel;
    
    // 头像赋值
    [_imgViewUser sd_setImageWithURL:[NSURL URLWithString:groupModel.logo_url] placeholderImage:[UIImage imageNamed:@"mask-gallery.png"]];
    
    // 题目赋值
    _labelTitle.text = groupModel.name;
    
    // 描述内容赋值
    _labelDescribe.text = groupModel.descriptionGroup;
    
    // 内容数和成员数赋值
    NSInteger countOne = groupModel.discuss_content_num + groupModel.topic_content_num;
    NSInteger countTwo = groupModel.member_num;
    NSString *str = [NSString stringWithFormat:@"%ld内容·%ld个成员", countOne, countTwo];
    self.labelContentCount.text = str;
}
@end
