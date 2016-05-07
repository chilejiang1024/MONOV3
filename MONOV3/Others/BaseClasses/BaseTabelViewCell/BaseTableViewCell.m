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
@property (nonatomic, strong) UIButton *buttonShare;
@property (nonatomic, strong) UIButton *buttonLike;
@property (nonatomic, strong) UIButton *buttonThumb;
@property (nonatomic, strong) UIButton *buttonComment;
@property (nonatomic, strong) UILabel *labelThumb;
@property (nonatomic, strong) UILabel *labelComment;

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
    
    if (self.controlPanelView == nil) {
        self.controlPanelView = [UIView.alloc init];
        [self.contentView addSubview:self.controlPanelView];
        
        self.buttonShare = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonShare.frame = CGRectMake(0, 0, 60, 60);
        [self.controlPanelView addSubview:self.buttonShare];
        
        self.buttonLike = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonLike.frame = CGRectMake(60, 0, 60, 60);
        [self.buttonLike setImage:[UIImage imageNamed:@"item-btn-like-on"] forState:UIControlStateSelected];
        [self.controlPanelView addSubview:self.buttonLike];
        
        self.buttonThumb = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonThumb.frame = CGRectMake(120, 0, 60, 60);
        [self.controlPanelView addSubview:self.buttonThumb];
        
        self.labelThumb = [UILabel.alloc initWithFrame:CGRectMake(170, 0, 30, 60)];
        self.labelThumb.textColor = [UIColor lightGrayColor];
        self.labelThumb.font = [UIFont systemFontOfSize:13.f];
        [self.controlPanelView addSubview:self.labelThumb];
        
        self.buttonComment = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonComment.frame = CGRectMake(180, 0, 60, 60);
        [self.controlPanelView addSubview:self.buttonComment];
        
        self.labelComment = [UILabel.alloc initWithFrame:CGRectMake(230, 0, 30, 60)];
        self.labelComment.textColor = [UIColor lightGrayColor];
        self.labelComment.font = [UIFont systemFontOfSize:13.f];
        [self.controlPanelView addSubview:self.labelComment];
    }
    
    self.labelThumb.text = [NSString stringWithFormat:@"%ld", thumbNum];
    self.labelComment.text = [NSString stringWithFormat:@"%ld", commentNum];

    
    if (self.controlPanelViewStyle == 0) {
        [self.buttonShare setImage:[UIImage imageNamed:@"item-btn-share-black"] forState:UIControlStateNormal];
        [self.buttonLike setImage:[UIImage imageNamed:@"item-btn-like-black"] forState:UIControlStateNormal];
        [self.buttonThumb setImage:[UIImage imageNamed:@"item-btn-thumb-black"] forState:UIControlStateNormal];
        [self.buttonThumb setImage:[UIImage imageNamed:@"item-btn-thumb-black-on"] forState:UIControlStateSelected];
        [self.buttonComment setImage:[UIImage imageNamed:@"item-btn-comment-black"] forState:UIControlStateNormal];
    } else {
        [self.buttonShare setImage:[UIImage imageNamed:@"item-btn-share-white"] forState:UIControlStateNormal];
        [self.buttonLike setImage:[UIImage imageNamed:@"item-btn-like-white"] forState:UIControlStateNormal];
        [self.buttonThumb setImage:[UIImage imageNamed:@"item-btn-thumb-white"] forState:UIControlStateNormal];
        [self.buttonThumb setImage:[UIImage imageNamed:@"item-btn-thumb-white-on"] forState:UIControlStateSelected];
        [self.buttonComment setImage:[UIImage imageNamed:@"item-btn-comment-white"] forState:UIControlStateNormal];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.controlPanelView.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 60, WIDTH, 60);
}

- (void)awakeFromNib {
    // Initialization code
    
    // 给所有继承的nib取消选中效果
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
