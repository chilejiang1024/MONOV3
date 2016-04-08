//
//  FindView.h
//  MONOV3
//
//  Created by JiangChile on 16/3/23.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseView.h"

@protocol FindViewDelegate <NSObject>

- (void)FindViewTopFiveButClickMethod:(NSInteger)sender;

@end

@interface FindView : BaseView

@property (nonatomic, assign) id<FindViewDelegate> delegateA;

- (void)setLunBoTuArray:(NSMutableArray *)arr;
- (void)getItemArr:(NSMutableArray *)arrAll;
- (void)getHeaderAllArr:(NSMutableArray *)arr;

@end
