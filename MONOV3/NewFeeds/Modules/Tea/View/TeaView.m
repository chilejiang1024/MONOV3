//
//  TeaView.m
//  MONOV3
//
//  Created by JiangChile on 16/3/24.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "TeaView.h"

#import "TeaModel.h"

#import "TeaCollectionViewCell.h"

#import "BaseCollectionView.h"

@interface TeaView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *arrayTeaHistory;

@end

static NSString *teaCollectionViewCellReuseID = @"teaCollectionViewCellReuseID";

@implementation TeaView

- (void)setArrayTeaHistory:(NSMutableArray *)arrayTeaHistory {
    _arrayTeaHistory = arrayTeaHistory;
    
    [self.collectionView.mj_header endRefreshing];
    [self.collectionView.mj_footer endRefreshing];
    
    [self.collectionView reloadData];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self createCollectionView];
}

#pragma mark - collection view

- (void)createCollectionView {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout.alloc init];
    layout.minimumInteritemSpacing = 0.5;
    layout.minimumLineSpacing = 1;
    layout.itemSize = CGSizeMake(WIDTH / 2 - 1, WIDTH / 2 - 0.5);
    
    BaseCollectionView *collectionView = [BaseCollectionView.alloc initWithFrame:self.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"TeaCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:teaCollectionViewCellReuseID];
    collectionView.backgroundColor = MONO_COLOR_LIGHT;
    self.collectionView = collectionView;
    [self addSubview:self.collectionView];
}

#pragma mark - collection delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayTeaHistory.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TeaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:teaCollectionViewCellReuseID forIndexPath:indexPath];
    cell.model = self.arrayTeaHistory[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.goToTeaDetailViewBlock([self.arrayTeaHistory[indexPath.row] teaId]);
}


@end
