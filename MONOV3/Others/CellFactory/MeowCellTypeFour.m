//
//  MeowCellTypeFour.m
//  MONOV3
//
//  Created by JiangChile on 16/3/28.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "MeowCellTypeFour.h"


@interface MeowCellTypeFour ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewUserAvatar;

@property (weak, nonatomic) IBOutlet UILabel *labelUserName;

@property (weak, nonatomic) IBOutlet UILabel *labelCreateDate;

@property (weak, nonatomic) IBOutlet UILabel *labelCategoryName;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewThumb;

@property (weak, nonatomic) IBOutlet UILabel *labelIntro;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UILabel *labelDescription;

@end

@implementation MeowCellTypeFour

- (void)setModel:(Meow *)model {
    [super setModel:model];
    
    [self setControlPanelViewStyle:self.model.kind.integerValue ThumbNum:self.model.bang_count.integerValue CommentNum:self.model.comment_count.integerValue];
    
    [self.imageViewUserAvatar sd_setImageWithURL:[NSURL URLWithString:self.model.user.avatar_url]];
    self.labelUserName.text     = self.model.user.name;
    NSDate *date                = [NSDate dateWithTimeIntervalSince1970:self.model.create_time];
    NSDateFormatter *formatter  = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy.MM.dd HH:mm"];
    NSString *dateStr           = [formatter stringFromDate:date];
    self.labelCreateDate.text   = dateStr;
    [self.imageViewThumb sd_setImageWithURL:[NSURL URLWithString:self.model.thumb.raw] placeholderImage:[UIImage imageNamed:@"mask-gallery.png"]];
    self.labelCategoryName.text = [NSString stringWithFormat:@"#%@", self.model.categoryModel.name];
    self.labelIntro.text        = self.model.intro;
    self.labelTitle.text        = self.model.title;
    self.labelDescription.text  = self.model.meowDescription;

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.imageViewThumb.frame;
    frame.size.height = 200;
    frame.size.width = WIDTH;
    self.imageViewThumb.frame = frame;
    
    frame = self.labelTitle.frame;
    frame.origin.x = 24;
    frame.origin.y = self.imageViewThumb.frame.origin.y + 205;
    frame.size.width = WIDTH - 48;
    self.labelTitle.frame = frame;
    
    frame = self.labelDescription.frame;
    frame.origin.x = 24;
    frame.origin.y = self.labelTitle.frame.origin.y + 60;
    frame.size.width = WIDTH - 48;
    self.labelDescription.frame = frame;

}

@end
