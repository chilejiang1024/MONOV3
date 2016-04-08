//
//  MeowCellTypeOne.m
//  MONOV3
//
//  Created by JiangChile on 16/3/28.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "MeowCellTypeOne.h"

#import "UIImageView+WebCache.h"

@interface MeowCellTypeOne ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewUserAvatar;

@property (weak, nonatomic) IBOutlet UILabel *labelUserName;

@property (weak, nonatomic) IBOutlet UILabel *labelReleaseDate;

@property (weak, nonatomic) IBOutlet UILabel *labelCategoryName;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewThumb;

@end

@implementation MeowCellTypeOne

// 重写父类setModel方法
- (void)setModel:(Meow *)model {
    [super setModel:model];
    
    [self setControlPanelViewStyle:self.model.kind.integerValue ThumbNum:self.model.bang_count.integerValue CommentNum:self.model.comment_count.integerValue];
    
    [self.imageViewUserAvatar sd_setImageWithURL:[NSURL URLWithString:self.model.user.avatar_url] placeholderImage:[UIImage imageNamed:@"mask-gallery"]];
    self.labelUserName.text = self.model.user.name;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.model.create_time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy.MM.dd HH:mm"];
    NSString *dateStr = [formatter stringFromDate:date];
    self.labelReleaseDate.text = dateStr;
    [self.imageViewThumb sd_setImageWithURL:[NSURL URLWithString:self.model.thumb.raw] placeholderImage:[UIImage imageNamed:@"mask-gallery"]];
    self.labelCategoryName.text = [NSString stringWithFormat:@"#%@", self.model.categoryModel.name];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.labelCategoryName.frame = CGRectMake(WIDTH - 50, 15, 50, 20);
    self.imageViewThumb.frame = CGRectMake(0, 50, WIDTH, 390);
    
}


@end
