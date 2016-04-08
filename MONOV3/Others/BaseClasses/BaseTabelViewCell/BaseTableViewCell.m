//
//  BaseTableViewCell.m
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface BaseTableViewCell ()

@property (nonatomic, assign) NSInteger controlPanelViewStyle;

@property (nonatomic, strong) UIView *controlPanelView;

@end

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


- (void)setModel:(Meow *)model {
    _model = model;
}

- (void)setControlPanelViewStyle:(NSInteger)controlPanelViewStyle ThumbNum:(NSInteger)thumbNum CommentNum:(NSInteger)commentNum {
    [self createControlPanelViewWithStyle:controlPanelViewStyle ThumbNum:thumbNum CommentNum:commentNum];
}

- (void)createControlPanelViewWithStyle:(NSInteger)style ThumbNum:(NSInteger)thumbNum CommentNum:(NSInteger)commentNum {
    UIView *controlPanelView = [UIView.alloc init];
    // controlPanelView.backgroundColor = [UIColor whiteColor];
    self.controlPanelView = controlPanelView;
    [self.contentView addSubview:self.controlPanelView];
    
    UIButton *buttonShare = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonShare.frame = CGRectMake(0, 0, 60, 60);
    [self.controlPanelView addSubview:buttonShare];
    
    UIButton *buttonLike = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonLike.frame = CGRectMake(60, 0, 60, 60);
    [buttonLike setImage:[UIImage imageNamed:@"item-btn-like-on"] forState:UIControlStateSelected];
    [self.controlPanelView addSubview:buttonLike];
    
    UIButton *buttonThumb = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonThumb.frame = CGRectMake(120, 0, 60, 60);
    [self.controlPanelView addSubview:buttonThumb];
    
    UILabel *labelThumb = [UILabel.alloc initWithFrame:CGRectMake(170, 0, 30, 60)];
    labelThumb.text = [NSString stringWithFormat:@"%ld", thumbNum];
    labelThumb.textColor = [UIColor lightGrayColor];
    labelThumb.font = [UIFont systemFontOfSize:13.f];
    [self.controlPanelView addSubview:labelThumb];
    
    UIButton *buttonComment = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonComment.frame = CGRectMake(180, 0, 60, 60);
    [self.controlPanelView addSubview:buttonComment];
    
    UILabel *labelComment = [UILabel.alloc initWithFrame:CGRectMake(230, 0, 30, 60)];
    labelComment.text = [NSString stringWithFormat:@"%ld", commentNum];
    labelComment.textColor = [UIColor lightGrayColor];
    labelComment.font = [UIFont systemFontOfSize:13.f];
    [self.controlPanelView addSubview:labelComment];
    
    if (self.controlPanelViewStyle == 0) {
        [buttonShare setImage:[UIImage imageNamed:@"item-btn-share-black"] forState:UIControlStateNormal];
        [buttonLike setImage:[UIImage imageNamed:@"item-btn-like-black"] forState:UIControlStateNormal];
        [buttonThumb setImage:[UIImage imageNamed:@"item-btn-thumb-black"] forState:UIControlStateNormal];
        [buttonThumb setImage:[UIImage imageNamed:@"item-btn-thumb-black-on"] forState:UIControlStateSelected];
        [buttonComment setImage:[UIImage imageNamed:@"item-btn-comment-black"] forState:UIControlStateNormal];
    } else {
        [buttonShare setImage:[UIImage imageNamed:@"item-btn-share-white"] forState:UIControlStateNormal];
        [buttonLike setImage:[UIImage imageNamed:@"item-btn-like-white"] forState:UIControlStateNormal];
        [buttonThumb setImage:[UIImage imageNamed:@"item-btn-thumb-white"] forState:UIControlStateNormal];
        [buttonThumb setImage:[UIImage imageNamed:@"item-btn-thumb-white-on"] forState:UIControlStateSelected];
        [buttonComment setImage:[UIImage imageNamed:@"item-btn-comment-white"] forState:UIControlStateNormal];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.controlPanelView.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 60, WIDTH, 60);
}

- (void)awakeFromNib {
    // Initialization code
    
    // 给所有继承的nib取消选中效果 以免重复渲染
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
