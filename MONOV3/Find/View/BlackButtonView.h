//
//  BlackButtonView.h
//  MONOV3
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseView.h"

@protocol  BlackButtonDelegate <NSObject>

- (void)putViewController:(UIButton *)button;

@end

@interface BlackButtonView : BaseView

@property (nonatomic, assign) id<BlackButtonDelegate>delegate;

- (void)passArr:(NSMutableArray *)arr;

@end
