//
//  MONOTools.h
//  MONOV3
//
//  Created by JiangChile on 16/3/24.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Meow.h"

typedef enum : NSUInteger {
    MONOAnimatorLeft,
    MONOAnimatorRight,
} MONOAnimator;

@interface MONOTools : NSObject

+ (instancetype)shareMONOTools;

/** 在view上添加子视图subView */
- (void)addSubview:(UIView *)subView ToView:(UIView *)view WithMONOAnimator:(MONOAnimator)animator;

/** 从父视图移除self视图 */
- (void)dismissView:(UIView *)view AndRemoveFromSuperViewWithMONOAnimator:(MONOAnimator)animator;

+ (CGFloat)getHeightLabel:(NSString *)text Weight:(CGFloat)weight FontOfSize:(CGFloat)fontOfSize;

+ (CGFloat)getHeightForCellWithMeowModel:(Meow *)model;


@end
