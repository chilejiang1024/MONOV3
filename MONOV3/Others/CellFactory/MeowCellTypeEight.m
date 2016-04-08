//
//  MeowCellTypeEight.m
//  MONOV3
//
//  Created by JiangChile on 16/3/29.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "MeowCellTypeEight.h"

#import "UIImageView+WebCache.h"

@interface MeowCellTypeEight ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewUserAvatar;

@property (weak, nonatomic) IBOutlet UILabel *labelUserName;

@property (weak, nonatomic) IBOutlet UILabel *labelCreateTime;

@property (weak, nonatomic) IBOutlet UILabel *labelType;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewThumb;

@property (weak, nonatomic) IBOutlet UILabel *labelBG;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewPlay;

@property (weak, nonatomic) IBOutlet UILabel *labelMusicDuration;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UILabel *labelDescription;

@end


@implementation MeowCellTypeEight

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
    [self.imageViewThumb sd_setImageWithURL:[NSURL URLWithString:self.model.thumb.raw] placeholderImage:[UIImage imageNamed:@"mask-gallery"]];
    self.labelTitle.text       = self.model.title;
    self.labelDescription.text = self.model.meowDescription;
    self.labelBG.text          = self.model.song_name;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

@end
