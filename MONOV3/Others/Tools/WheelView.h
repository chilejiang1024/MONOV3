//
//  WheelView.h
//  封装轮播图
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 灬绮罗. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WheelViewDelegate <NSObject>
@optional
- (void)clickWheelView:(NSInteger)picNumber;
@end
@interface WheelView : UIScrollView
@property (nonatomic, assign) id<WheelViewDelegate> delegateA;
- (instancetype)initWithFrame:(CGRect)frame DataArray:(NSMutableArray *)dataArray;
@end
