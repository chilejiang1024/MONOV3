//
//  WheelView.m
//  封装轮播图
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 灬绮罗. All rights reserved.
//

#import "WheelView.h"
#import "UIImageView+WebCache.h"
@interface WheelView ()<UIScrollViewDelegate>
@property (nonatomic, retain) UIImageView *imgBefor;
@property (nonatomic, retain) UIImageView *imgMid;
@property (nonatomic, retain) UIImageView *imgNext;
@property (nonatomic, assign) NSInteger picBefor;
@property (nonatomic, assign) NSInteger picMid;
@property (nonatomic, assign) NSInteger picNext;
@property (nonatomic, assign) NSInteger picCount;
@property (nonatomic, retain) NSMutableArray *arrayPic;
@end
@implementation WheelView
- (instancetype)initWithFrame:(CGRect)frame DataArray:(NSMutableArray *)dataArray{
    self = [super initWithFrame:frame];
    if (self) {
        _picCount = dataArray.count - 1;
        _picBefor = dataArray.count - 1;
        _arrayPic = dataArray;
        _picMid = 0;
        _picNext = 1;
        [self createWheelView];
    }
    return self;
}
- (void)createWheelView{
    self.contentSize = CGSizeMake(3 * self.frame.size.width, self.frame.size.height);
    self.contentOffset = CGPointMake(self.frame.size.width, 0);
    self.showsHorizontalScrollIndicator = NO;
    self.pagingEnabled = YES;
    self.delegate = self;
    [self createImageView];
    [_imgBefor sd_setImageWithURL:[NSURL URLWithString:_arrayPic[_picBefor]]];
    [_imgMid sd_setImageWithURL:[NSURL URLWithString:_arrayPic[_picMid]]];
    [_imgNext sd_setImageWithURL:[NSURL URLWithString:_arrayPic[_picNext]]];
}
- (void)createImageView{
    _imgBefor = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_imgBefor];
    _imgMid = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_imgMid];
    _imgMid.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [_imgMid addGestureRecognizer:tap];
    _imgNext = [[UIImageView alloc] initWithFrame:CGRectMake(2 * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_imgNext];
}
- (void)click{
    [self.delegateA clickWheelView:_picMid];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.contentOffset.x == 2 * self.frame.size.width) {
        self.contentOffset = CGPointMake(self.frame.size.width, 0);
        _picBefor++;
        _picMid++;
        _picNext++;
        if (_picBefor > _picCount) {
            _picBefor = 0;
        }
        if (_picMid > _picCount) {
            _picMid = 0;
        }
        if (_picNext > _picCount) {
            _picNext = 0;
        }
        [_imgBefor sd_setImageWithURL:[NSURL URLWithString:_arrayPic[_picBefor]]];
        [_imgMid sd_setImageWithURL:[NSURL URLWithString:_arrayPic[_picMid]]];
        [_imgNext sd_setImageWithURL:[NSURL URLWithString:_arrayPic[_picNext]]];
    } else if (self.contentOffset.x == 0) {
        self.contentOffset = CGPointMake(self.frame.size.width, 0);
        _picBefor--;
        _picMid--;
        _picNext--;
        if (_picBefor < 0) {
            _picBefor = _arrayPic.count - 1;
        }
        if (_picMid < 0) {
            _picMid = _arrayPic.count - 1;
        }
        if (_picNext < 0) {
            _picNext = _arrayPic.count - 1;
        }
        [_imgBefor sd_setImageWithURL:[NSURL URLWithString:_arrayPic[_picBefor]]];
        [_imgMid sd_setImageWithURL:[NSURL URLWithString:_arrayPic[_picMid]]];
        [_imgNext sd_setImageWithURL:[NSURL URLWithString:_arrayPic[_picNext]]];
    }
}

@end
