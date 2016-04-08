//
//  YellowBtnTableViewCellSecondCollectionViewCell.m
//  MONOV3
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "YellowBtnTableViewCellSecondCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface YellowBtnTableViewCellSecondCollectionViewCell ()
@property (nonatomic, retain) UIImageView *picView;
@end

@implementation YellowBtnTableViewCellSecondCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCell];
    }
    return self;
}

- (void)createCell{
    self.picView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//    self.picView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.picView];
}

- (void)setPicPath:(NSString *)picPath{
    [self.picView sd_setImageWithURL:[NSURL URLWithString:picPath]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
