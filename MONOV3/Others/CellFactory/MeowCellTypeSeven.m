//
//  MeowCellTypeSeven.m
//  MONOV3
//
//  Created by JiangChile on 16/3/28.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "MeowCellTypeSeven.h"

#import "UIImageView+WebCache.h"

@interface MeowCellTypeSeven ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewUserAvatar;

@property (weak, nonatomic) IBOutlet UILabel *lableCategoryName;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewThumb;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewThumbBG;

@property (weak, nonatomic) IBOutlet UILabel *labelDescription;

@property (weak, nonatomic) IBOutlet UILabel *labelLine;

@property (weak, nonatomic) IBOutlet UILabel *labelUserName;

@property (weak, nonatomic) IBOutlet UILabel *labelCreateDate;


@property (nonatomic, strong) UIVisualEffectView *visualEffectView;

@end


@implementation MeowCellTypeSeven

/** 毛玻璃 */
- (UIVisualEffectView *)visualEffectView {
    if (!_visualEffectView) {
        _visualEffectView       = [UIVisualEffectView.alloc initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        _visualEffectView.contentView.alpha = 0.8f;
        _visualEffectView.frame = CGRectMake(0, 0, WIDTH, 260);
    }
    return _visualEffectView;
}

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
    [self.imageViewUserAvatar sd_setImageWithURL:[NSURL URLWithString:self.model.user.avatar_url]];
    self.lableCategoryName.text = [NSString stringWithFormat:@"#%@", self.model.categoryModel.name];
    [self.imageViewThumbBG sd_setImageWithURL:[NSURL URLWithString:self.model.thumb.raw] placeholderImage:[UIImage imageNamed:@"mask-gallery"]];
    [self.imageViewThumbBG addSubview:self.visualEffectView];
    self.labelTitle.text        = self.model.title;
    [self.imageViewThumb sd_setImageWithURL:[NSURL URLWithString:self.model.thumb.raw] placeholderImage:[UIImage imageNamed:@"mask-gallery"]];
    self.labelDescription.text  = self.model.meowDescription;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageViewThumb.frame   = CGRectMake(0, 13, WIDTH, 200);
    self.imageViewThumbBG.frame = CGRectMake(0, 213, WIDTH, 260);
    self.labelLine.frame        = CGRectMake(20, self.contentView.frame.origin.y - 60, WIDTH - 40, 1);
    self.labelTitle.frame       = CGRectMake(40, 13 + 200 + 10, WIDTH - 80, 80);
    self.labelDescription.frame = CGRectMake(20, 13 + 200 + 10 + 80, WIDTH - 40, 100);
}


@end
