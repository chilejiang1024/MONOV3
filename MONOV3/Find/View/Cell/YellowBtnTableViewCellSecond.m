//
//  YellowBtnTableViewCellSecond.m
//  MONOV3
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "YellowBtnTableViewCellSecond.h"
#import "YellowBtnTableViewCellSecondCollectionViewCell.h"

@interface YellowBtnTableViewCellSecond ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UICollectionView *collection;
@property (nonatomic, retain) NSMutableArray *arrPic;
@end

@implementation YellowBtnTableViewCellSecond

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createCell];
    }
    return self;
}

- (void)createCell{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 3 - 10, [UIScreen mainScreen].bounds.size.width / 3 - 10);
    layout.minimumInteritemSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 1.5 - [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width) collectionViewLayout:layout];
    collection.scrollEnabled = NO;
    self.collection = collection;
    [self.contentView addSubview:self.collection];
    [collection registerClass:[YellowBtnTableViewCellSecondCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"foot"];
    [collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    collection.delegate = self;
    collection.dataSource = self;
    collection.backgroundColor = [UIColor whiteColor];
    
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, [UIScreen mainScreen].bounds.size.width, 30)];
    self.titleLabel.textAlignment = 1;
//    self.titleLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.titleLabel];
}

- (void)setMeow:(MeowsModel *)meow{
    self.titleLabel.text = meow.title;
    self.arrPic = meow.pics;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrPic.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YellowBtnTableViewCellSecondCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.picPath = [self.arrPic[indexPath.row] raw];
    return cell;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
