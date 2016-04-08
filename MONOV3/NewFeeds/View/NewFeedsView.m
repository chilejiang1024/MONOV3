//
//  NewFeedsView.m
//  MONOV3
//
//  Created by JiangChile on 16/3/22.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "NewFeedsView.h"

#import "NewFeedsCollectionViewCell.h"
#import "NewFeedsButtonCollectionViewCell.h"

@interface NewFeedsView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionViewButtons;

@property (nonatomic, strong) UICollectionView *collectionViewVCs;

@end

static NSString *collectionVeiwButtonsReuseID = @"collectionVeiwButtonsReuseID";

static NSString *collectionVeiwVCsReuseID0    = @"collectionVeiwVCsReuseID0";
static NSString *collectionVeiwVCsReuseID1    = @"collectionVeiwVCsReuseID1";
static NSString *collectionVeiwVCsReuseID2    = @"collectionVeiwVCsReuseID2";
static NSString *collectionVeiwVCsReuseID3    = @"collectionVeiwVCsReuseID3";
static NSString *collectionVeiwVCsReuseID4    = @"collectionVeiwVCsReuseID4";
static NSString *collectionVeiwVCsReuseID5    = @"collectionVeiwVCsReuseID5";

@implementation NewFeedsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}

- (void)createView {
    [self createCollectionView];
    
}

#pragma mark - create collection views

- (void)createCollectionView {
    // 顶部选项collection view
    UICollectionViewFlowLayout *laytouButtons = [UICollectionViewFlowLayout.alloc init];
    laytouButtons.minimumInteritemSpacing = 0;
    laytouButtons.minimumLineSpacing = 0;
    laytouButtons.itemSize = CGSizeMake(130, 50);
    laytouButtons.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    laytouButtons.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collectionViewButtons = [UICollectionView.alloc initWithFrame:CGRectMake(0, 20, WIDTH, 50) collectionViewLayout:laytouButtons];
    collectionViewButtons.backgroundColor = [UIColor blackColor];
    [collectionViewButtons registerNib:[UINib nibWithNibName:@"NewFeedsButtonCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"collectionVeiwButtonsReuseID"];
    collectionViewButtons.delegate = self;
    collectionViewButtons.dataSource = self;
    self.collectionViewButtons = collectionViewButtons;
    [self addSubview:self.collectionViewButtons];
    
    // 主要的展示VC的collection view
    UICollectionViewFlowLayout *laytouVCs = [UICollectionViewFlowLayout.alloc init];
    laytouVCs.minimumLineSpacing = 0;
    laytouVCs.minimumInteritemSpacing = 0;
    laytouVCs.itemSize = CGSizeMake(WIDTH, HEIGHT - 70);
    laytouVCs.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    laytouVCs.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collectionViewVCs = [UICollectionView.alloc initWithFrame:CGRectMake(0, 70, WIDTH, HEIGHT - 70) collectionViewLayout:laytouVCs];
    collectionViewVCs.backgroundColor = MONO_COLOR_LIGHT;
    collectionViewVCs.pagingEnabled = YES;
    [collectionViewVCs registerClass:[NewFeedsCollectionViewCell class] forCellWithReuseIdentifier:collectionVeiwVCsReuseID0];
    [collectionViewVCs registerClass:[NewFeedsCollectionViewCell class] forCellWithReuseIdentifier:collectionVeiwVCsReuseID1];
    [collectionViewVCs registerClass:[NewFeedsCollectionViewCell class] forCellWithReuseIdentifier:collectionVeiwVCsReuseID2];
    [collectionViewVCs registerClass:[NewFeedsCollectionViewCell class] forCellWithReuseIdentifier:collectionVeiwVCsReuseID3];
    [collectionViewVCs registerClass:[NewFeedsCollectionViewCell class] forCellWithReuseIdentifier:collectionVeiwVCsReuseID4];
    [collectionViewVCs registerClass:[NewFeedsCollectionViewCell class] forCellWithReuseIdentifier:collectionVeiwVCsReuseID5];
    collectionViewVCs.delegate = self;
    collectionViewVCs.dataSource = self;
    self.collectionViewVCs = collectionViewVCs;
    [self addSubview:self.collectionViewVCs];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return NEWFEEDSARRAY.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([collectionView isEqual:self.collectionViewButtons]) {
        NewFeedsButtonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionVeiwButtonsReuseID forIndexPath:indexPath];
        cell.moduleName = NEWFEEDSARRAY[indexPath.row];
        return cell;
    } else {
        NewFeedsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[NSString stringWithFormat:@"collectionVeiwVCsReuseID%ld", indexPath.row] forIndexPath:indexPath];
        cell.newFeedsCollectionViewCellType = indexPath.row;
        cell.backgroundColor = COLOR_RANDOM;
        return cell;
    }
}

#pragma mark - scroll view delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.collectionViewButtons]) {
        return;
    }
    float showPage = scrollView.contentOffset.x / WIDTH;
    if (showPage <= 1) {
        return;
    }
    if (showPage * 130 > self.collectionViewButtons.contentSize.width) {
        self.collectionViewButtons.contentOffset = (CGPoint){self.collectionViewButtons.contentSize.width - WIDTH, 0};
        return;
    }
    self.collectionViewButtons.contentOffset = CGPointMake(130 * (showPage - 1), 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.collectionViewButtons]) {
        return;
    }
    NSInteger showPage = scrollView.contentOffset.x / WIDTH;
    NSArray *arrayIndexPath = [self.collectionViewButtons indexPathsForVisibleItems];
    // 将显示的所有cell label text color 置为白色
    for (NSIndexPath *indexPath in arrayIndexPath) {
        NewFeedsButtonCollectionViewCell *cell = (NewFeedsButtonCollectionViewCell *)[self.collectionViewButtons cellForItemAtIndexPath:indexPath];
        cell.isShow = NO;
    }
    // 将显示的VC对应的cell label text color 置为 MONO_COLOR
    showPage = showPage == 0 ? 0 : 1;
    NewFeedsButtonCollectionViewCell *cell = (NewFeedsButtonCollectionViewCell *)[self.collectionViewButtons cellForItemAtIndexPath:arrayIndexPath[showPage]];
    cell.isShow = YES;
}


@end
