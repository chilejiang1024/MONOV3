//
//  YellowBtnTableViewCellFirst.m
//  MONOV3
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "YellowBtnTableViewCellFirst.h"

@interface YellowBtnTableViewCellFirst ()

@property (nonatomic, retain) UIImageView *backgroundImageView;
@property (nonatomic, retain) UIImageView *iconImageView;
@property (nonatomic, retain) UILabel *typeLabel;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *contentLabel;

@end

@implementation YellowBtnTableViewCellFirst

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createCell];
    }
    return self;
}

- (void)createCell{
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 4)];
    [self.contentView addSubview:self.backgroundImageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,  [UIScreen mainScreen].bounds.size.height / 4 + 5,  [UIScreen mainScreen].bounds.size.width, 30)];
    self.titleLabel.textAlignment = 1;
    [self.contentView addSubview:self.titleLabel];
    
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, [UIScreen mainScreen].bounds.size.height / 4 + 5 + 30, [UIScreen mainScreen].bounds.size.width - 10, 35)];
    self.contentLabel.font = [UIFont systemFontOfSize:12];
    self.contentLabel.numberOfLines = 0;
    [self.contentView addSubview:self.contentLabel];
}

- (void)setMeows:(MeowsModel *)meows{
    [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:meows.thumb.raw]];
    self.titleLabel.text = meows.title;
    self.contentLabel.text = meows.descriptionMeows;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
