//
//  NewFeedsButtonCollectionViewCell.m
//  MONOV3
//
//  Created by JiangChile on 16/3/24.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "NewFeedsButtonCollectionViewCell.h"


@interface NewFeedsButtonCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelModuleName;

@end


@implementation NewFeedsButtonCollectionViewCell

- (void)setModuleName:(NSString *)moduleName {
    _moduleName = moduleName;
    
    self.labelModuleName.text = _moduleName;
    self.labelModuleName.textColor = [UIColor whiteColor];
}

- (void)setIsShow:(BOOL)isShow {
    if (isShow) {
        self.labelModuleName.textColor = MONO_COLOR;
    } else {
        self.labelModuleName.textColor = [UIColor whiteColor];
    }
}

- (void)awakeFromNib {
    
}

@end
