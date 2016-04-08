//
//  MineSignInView.h
//  MONOV3
//
//  Created by JiangChile on 16/3/23.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseView.h"

@protocol MineSignInViewDelegate <NSObject>

- (void)clickLoginType:(NSInteger)type;

@end

@interface MineSignInView : BaseView

@property (nonatomic, assign) id<MineSignInViewDelegate> delegate;

@end
