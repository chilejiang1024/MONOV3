//
//  MONOTools.m
//  MONOV3
//
//  Created by JiangChile on 16/3/24.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "MONOTools.h"

@implementation MONOTools

+ (instancetype)shareMONOTools {
    static MONOTools *tools = nil;
    // 线程安全下的单例
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [MONOTools.alloc init];
    });
    return tools;
}

#pragma mark - add subview animator

- (void)addSubview:(UIView *)subView ToView:(UIView *)view WithMONOAnimator:(MONOAnimator)animator {
    if (animator == MONOAnimatorLeft) {
        
    } else if (animator == MONOAnimatorRight) {
        CGRect frame = subView.frame;
        frame.origin.x = WIDTH;
        subView.frame = frame;
    }
    [view addSubview:subView];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = view.frame;
        frame.origin.x = view.frame.origin.x;
        subView.frame = frame;
    }];
}

- (void)dismissView:(UIView *)view AndRemoveFromSuperViewWithMONOAnimator:(MONOAnimator)animator {
    __block CGRect frame;
    __block typeof(view) weakView = view;
    if (animator == MONOAnimatorLeft) {
        
    } else if (animator == MONOAnimatorRight) {
        frame = view.frame;
        frame.origin.x = WIDTH;
    }
    [UIView animateWithDuration:0.3 animations:^{
        weakView.frame = frame;
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakView removeFromSuperview];
        weakView = nil;
    });
}

+ (CGFloat)getHeightLabel:(NSString *)text Weight:(CGFloat)weight FontOfSize:(CGFloat)fontOfSize{
    
    CGSize size = CGSizeMake(weight, MAXFLOAT);
    
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontOfSize] forKey:NSFontAttributeName];
    
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return rect.size.height;
}

+ (CGFloat)getHeightForCellWithMeowModel:(Meow *)model {
    CGFloat height = 0;
    switch (model.meow_type.integerValue) {
        case 1 :
            height = 500;
            break;
            
        case 2 :
            break;
            
        case 3 :
            break;
            
        case 4 :
            height = 13 + 200 + 50 + 40 + 60;
            break;
            
        case 5 :
            break;
            
        case 6 :
            break;
            
        case 7 :
            height = 13 + 200 + 260;
            break;
            
        case 8 :
            height = 400;
            break;
            
        case 9 :
            height = 400;
            break;
            
        default:
            break;
    }
    
    return height;
}

@end
