//
//  TeaCollectionViewCell.m
//  MONOV3
//
//  Created by JiangChile on 16/3/24.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "TeaCollectionViewCell.h"

#import "TeaModel.h"

@interface TeaCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelDate;

@property (weak, nonatomic) IBOutlet UILabel *labelDay;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewTeaKind;

@property (weak, nonatomic) IBOutlet UILabel *labelTeaKind;


@end


@implementation TeaCollectionViewCell

- (void)setModel:(TeaModel *)model {
    _model = model;
    
    NSArray *monthInEnglish = @[@"none", @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"];
    
    NSString *year  = @"";
    NSString *month = @"";
    NSString *day   = @"";
    NSArray *date   = [_model.release_date componentsSeparatedByString:@"-"];
    year            = date[0];
    month           = date[1];
    day             = date[2];
    
    self.labelDate.text = [NSString stringWithFormat:@"%@ %@", year, monthInEnglish[month.integerValue]];
    self.labelDay.text  = day;
    // kind == 0 早茶  kind == 1 下午茶
    if (_model.kind == 0) {
        self.imageViewTeaKind.image = [UIImage imageNamed:@"icon-morning-tea-unread"];
//        self.imageViewTeaKind.frame = CGRectMake(WIDTH / 4 - 10, 110, 20, 20);
        self.labelTeaKind.text = @"早茶";
    } else {
        self.imageViewTeaKind.image = [UIImage imageNamed:@"icon-afternoon-tea-unread"];
//        self.imageViewTeaKind.frame = CGRectMake(WIDTH / 4 - 10, 110, 16, 22);
        self.labelTeaKind.text = @"下午茶";
    }
}

- (void)layoutSubviews {
//    self.labelDate.frame = CGRectMake(0, 20, CGRectGetWidth(self.frame), 20);
//    self.labelDay.frame = CGRectMake(WIDTH / 4 - 50, 20, 100, 100);
//    self.labelTeaKind.frame = CGRectMake(WIDTH / 4 - 50, 140, 100, 30);
}

- (void)awakeFromNib {
    self.backgroundColor = [UIColor whiteColor];
}

@end
