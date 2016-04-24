//
//  YellowButtonView.h
//  MONOV3
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseView.h"

@protocol YellowButtonViewDelegate <NSObject>
@optional
- (void)clickCell:(NSInteger)index Type:(NSString *)type;
@end

@interface YellowButtonView : BaseView
@property (nonatomic, assign) id<YellowButtonViewDelegate> delegate;
- (void)createTitleScrollView:(NSMutableArray *)array;
@end
