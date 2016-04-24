//
//  BaseWebView.m
//  MONOV3
//
//  Created by JiangChile on 16/4/5.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseWebView.h"

#import "MBProgressHUD.h"

@interface BaseWebView ()

@property (nonatomic, copy) NSString *url;

@end


@implementation BaseWebView

- (instancetype)initWithFrame:(CGRect)frame URL:(NSString *)urlStr {
    frame.size.height += 70;
    if (self = [super initWithFrame:frame]) {
        _url = urlStr;
        [self createView];
    }
    return self;
}

- (void)createView {
    [MBProgressHUD showHUDAddedTo:self animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self animated:YES];
    });
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [self loadRequest:request];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(byebye:)];
    [self addGestureRecognizer:pan];
}

#pragma mark - 消失动画

- (void)byebye:(UIPanGestureRecognizer *)pan {
    CGFloat x = [pan translationInView:self].x;
    if (x < 0) {
        return;
    }
    self.frame = CGRectMake(x, 0, WIDTH, self.frame.size.height);
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (x < WIDTH / 2) {
            x = 0;
        } else {
            x = WIDTH;
        }
        [UIView animateWithDuration:0.3 animations:^{
            self.frame = CGRectMake(x, 0, WIDTH, self.frame.size.height);
        }];
        if (x == WIDTH) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self removeFromSuperview];
            });
        }
    }
}

#pragma mark - hide加载提示



@end
