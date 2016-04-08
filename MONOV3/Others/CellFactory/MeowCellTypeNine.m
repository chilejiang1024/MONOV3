//
//  MeowCellTypeNine.m
//  MONOV3
//
//  Created by JiangChile on 16/3/29.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "MeowCellTypeNine.h"

#import "UIImageView+WebCache.h"

@interface MeowCellTypeNine ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewUserAvatar;

@property (weak, nonatomic) IBOutlet UILabel *labelUserName;

@property (weak, nonatomic) IBOutlet UILabel *labelCreateTime;

@property (weak, nonatomic) IBOutlet UILabel *labelType;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewThumb;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UILabel *labelNumOfPics;

@property (weak, nonatomic) IBOutlet UILabel *labelDescription;

@property (weak, nonatomic) IBOutlet UILabel *labelLine;

@end


@implementation MeowCellTypeNine

- (void)setModel:(Meow *)model {
    [super setModel:model];

    [self setControlPanelViewStyle:self.model.kind.integerValue ThumbNum:self.model.bang_count.integerValue CommentNum:self.model.comment_count.integerValue];

    [self.imageViewUserAvatar sd_setImageWithURL:[NSURL URLWithString:self.model.user.avatar_url] placeholderImage:[UIImage imageNamed:@"mask-gallery"]];
    self.labelUserName.text    = self.model.user.name;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:self.model.create_time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy.MM.dd HH:mm"];
    NSString *dateStr          = [formatter stringFromDate:date];
    self.labelCreateTime.text  = dateStr;
    [self.imageViewThumb sd_setImageWithURL:[NSURL URLWithString:[self.model.images.firstObject raw]] placeholderImage:[UIImage imageNamed:@"mask-gallery"]];
    self.labelTitle.text       = self.model.title;
    self.labelDescription.text = self.model.meowDescription;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageViewThumb.frame = CGRectMake(0, 0, WIDTH, 390);
    self.labelLine.frame = CGRectMake(10, 320, WIDTH - 20, 1);
}

@end
