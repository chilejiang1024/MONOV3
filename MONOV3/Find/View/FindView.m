//
//  FindView.m
//  MONOV3
//
//  Created by JiangChile on 16/3/23.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "FindView.h"

#import "FindCollectionViewCell.h"

#import "FindSpecialCollectionViewCell.h"

#import "FindModel.h"

#import "UIImageView+WebCache.h"

#import "WheelView.h"

#import "Group.h"

#import "Collection.h"

#import "User.h"

#import "MJRefresh.h"

@interface FindView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *LunBoTuImageView;
@property (nonatomic, strong) UICollectionReusableView *headViewBig;
@property (nonatomic, strong) UICollectionReusableView *headViewSmallOne;
@property (nonatomic, strong) UICollectionReusableView *headViewSmallTwo;
@property (nonatomic, strong) UIButton *buttonBigHeaderView;
@property (nonatomic, strong) UIButton *buttonYellow;
@property (nonatomic, strong) UIButton *buttonBlack;
@property (nonatomic, strong) NSMutableArray *arrAll;
@property (nonatomic, strong) NSMutableArray *arrHeaderAll;

@property (nonatomic, strong) UIImageView *SmallHeadOneImgView;
@property (nonatomic, strong) UILabel *SmallHeadOneLabelTitle;
@property (nonatomic, strong) UILabel *SmallHeadOneLabelLine;
@property (nonatomic, strong) UIImageView *SmallHeadOneUserImgView;
@property (nonatomic, strong) UILabel *SmallHeadOneLabelName;
@property (nonatomic, strong) UILabel *SmallHeadOneLabelContent;
@property (nonatomic, strong) UILabel *SmallHeadOneLabelCount;

@property (nonatomic, strong) UILabel *smallHeadTwoLabelTitle;
@property (nonatomic, strong) UIButton *smallHeadTwoButton;
@property (nonatomic, strong) UILabel *smallHeadTwoLabelCollectionPerson;
@property (nonatomic, strong) UILabel *smallHeadTwoLabelContentCount;
@property (nonatomic, strong) NSMutableArray *arrAllHeader;

@end


@implementation FindView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        [self createView];
        [self updateData];
    }
    return self;
}

- (void)createView {
    [self createCollectionView];
}

#pragma mark - create CollectionView
- (void)createCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.itemSize = CGSizeMake(WIDTH / 2, WIDTH / 2);
    // 每行之间的最小距离
    layout.minimumInteritemSpacing = 0;
    // 每列之间的最小距离
    layout.minimumLineSpacing = 0;
    // layout纵向滑动
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20 * H, WIDTH, HEIGHT - 69 * H) collectionViewLayout:layout];
    
    // 使用注册的方法 写重用池
    [self.collectionView registerClass:[FindCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[FindSpecialCollectionViewCell class] forCellWithReuseIdentifier:@"specialCell"];
    // 注册页眉
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerBig"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerSmallOne"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerSmallTwo"];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self addSubview:self.collectionView];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    int i = 0;
    if (i < 3) {
        i++;
        return 3;
    } else {
    return self.arrAllHeader.count;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return [self.arrAll[0] count];
    } else if (section % 2 == 1) {

        return [self.arrAll[1] count];
    } else {
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    id model = self.arrAll[indexPath.section][indexPath.row];

    if ([model isKindOfClass:[Collection class]]) {
        FindSpecialCollectionViewCell *specialCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"specialCell" forIndexPath:indexPath];
        specialCell.model = model;
        return specialCell;
    } else {
        FindCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
}

// 分组的头视图创建
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        self.headViewBig = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerBig" forIndexPath:indexPath];
        self.headViewBig.backgroundColor = [UIColor whiteColor];
        [self createScrollView];
        [self createButton];
        return self.headViewBig;
    } else if (indexPath.section % 2 == 1) {
        self.headViewSmallOne = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerSmallOne" forIndexPath:indexPath];
        self.headViewSmallOne.backgroundColor = [UIColor blackColor];
        [self createHeadViewSmallOne];
        return self.headViewSmallOne;
    } else {
        self.headViewSmallTwo = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerSmallTwo" forIndexPath:indexPath];
        self.headViewSmallTwo.backgroundColor = [UIColor colorWithRed:1 green:0.86 blue:0.38 alpha:1.0];
        [self createHeadViewSmallTwo];
        return self.headViewSmallTwo;
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        
        return CGSizeMake(WIDTH, 450 * H);
    } else {
        return CGSizeMake(WIDTH, 200 * H);
    }
}

#pragma mark - 头视图中的轮播图创建

- (void)createScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 200 * H)];
//    self.scrollView.backgroundColor = [UIColor greenColor];
    self.scrollView.contentSize = CGSizeMake(WIDTH * 3 * W, 200 * H);
    // 设置按页滚动
    self.scrollView.pagingEnabled = YES;
    // 取消边界反弹
    self.scrollView.bounces = NO;
    // 取消滑动条的显示
        self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.headViewBig addSubview:self.scrollView];
}

#pragma mark - 头视图中的按钮

- (void)createButton {
    // 上面的五个按钮
    for (int i = 0; i < 5; i++) {
        self.buttonBigHeaderView = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonBigHeaderView.frame = CGRectMake(WIDTH / 5 * i, 235 * H, WIDTH / 5, WIDTH / 5 - 10 * H);
//        self.button.backgroundColor = COLOR_RANDOM;
        [self.buttonBigHeaderView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"menu-button-%d", i]] forState:UIControlStateNormal];
        self.buttonBigHeaderView.tag = 1000 + i;
        [self.buttonBigHeaderView addTarget:self action:@selector(letDelegateGetTag:) forControlEvents:UIControlEventTouchUpInside];
        [self.headViewBig addSubview:self.buttonBigHeaderView];
    }
    
    // 下面的两个按钮
    self.buttonYellow = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonYellow.frame = CGRectMake(0, 350 * H, WIDTH / 2, 100 * H);
    self.buttonYellow.backgroundColor = [UIColor yellowColor];
    [self.buttonYellow setBackgroundImage:[UIImage imageNamed:@"yellow.png"] forState:UIControlStateNormal];
    [self.buttonYellow addTarget:self action:@selector(clickYellowButton) forControlEvents:UIControlEventTouchUpInside];
    [self.headViewBig addSubview:self.buttonYellow];
    
    self.buttonBlack = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonBlack.frame = CGRectMake(WIDTH / 2, 350 * H, WIDTH / 2, 100 * H);
    self.buttonBlack.backgroundColor = [UIColor blackColor];
    [self.buttonBlack setBackgroundImage:[UIImage imageNamed:@"black.png"] forState:UIControlStateNormal];
    [self.buttonBlack addTarget:self action:@selector(clickBlackButton) forControlEvents:UIControlEventTouchUpInside];
    [self.headViewBig addSubview:self.buttonBlack];
}

- (void)letDelegateGetTag:(UIButton *)sender{
    [self.delegateA FindViewTopFiveButClickMethod:sender.tag];
}

#pragma mark - headViewBig按钮的点击方法

- (void)clickYellowButton {
    [self.delegateA FindViewTopFiveButClickMethod:10086];
}

- (void)clickBlackButton {
    [self.delegateA FindViewTopFiveButClickMethod:10087];
}


#pragma mark - headViewSmallOne控件

- (void)createHeadViewSmallOne {
    
    // 创建HeadViewOneBackGroundImageView
    UIImageView *backGroundImageView = [[UIImageView alloc] initWithFrame:self.headViewSmallOne.bounds];
//    backGroundImageView.backgroundColor = [UIColor redColor];
    [self.headViewSmallOne addSubview:backGroundImageView];
    
    // 一起聊一聊图片
    self.SmallHeadOneImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-explore-campaign-logo.png"]];
    self.SmallHeadOneImgView.frame = CGRectMake(150 * W, 20 * H, 115 * W, 25 * H);
//    self.SmallHeadOneImgView.backgroundColor = [UIColor whiteColor];
    [self.headViewSmallOne addSubview:self.SmallHeadOneImgView];
    
    // 题目
    self.SmallHeadOneLabelTitle = [[UILabel alloc] initWithFrame:CGRectMake(50 * W, 60 * H, WIDTH - 100 * W, 30 * H)];
//    self.SmallHeadOneLabelTitle.backgroundColor = [UIColor whiteColor];
    self.SmallHeadOneLabelTitle.font = [UIFont systemFontOfSize:20];
    self.SmallHeadOneLabelTitle.textAlignment = NSTextAlignmentCenter;
    self.SmallHeadOneLabelTitle.textColor = [UIColor whiteColor];
    [self.headViewSmallOne addSubview:self.SmallHeadOneLabelTitle];
    
    // 一条线
    self.SmallHeadOneLabelLine = [[UILabel alloc] initWithFrame:CGRectMake((WIDTH - 80 * W) / 2, 120 * H, 80 * W, 1 * H)];
    self.SmallHeadOneLabelLine.backgroundColor = [UIColor grayColor];
    [self.headViewSmallOne addSubview:self.SmallHeadOneLabelLine];
    
    // 头像
    self.SmallHeadOneUserImgView = [[UIImageView alloc] initWithFrame:CGRectMake((WIDTH - 80 * W) / 2 - 20 * W, 120 * H, 20 * W, 20 * H)];
//    self.SmallHeadOneUserImgView.backgroundColor = [UIColor whiteColor];
    self.SmallHeadOneUserImgView.layer.cornerRadius = 10 * H;
    
    [self.headViewSmallOne addSubview:self.SmallHeadOneUserImgView];
    
    // 名字
    self.SmallHeadOneLabelName = [[UILabel alloc] initWithFrame:CGRectMake((WIDTH - 80 * W) / 2 + 5 * W, 122 * H, 100 * W, 15 * H)];
//    self.SmallHeadOneLabelName.backgroundColor = [UIColor whiteColor];
    self.SmallHeadOneLabelName.font = [UIFont systemFontOfSize:12];
    self.SmallHeadOneLabelName.textColor = [UIColor whiteColor];
    [self.headViewSmallOne addSubview:self.SmallHeadOneLabelName];
    
    // 内容
    self.SmallHeadOneLabelContent = [[UILabel alloc] initWithFrame:CGRectMake(80 * W, 150 * H, WIDTH - 160 * W, 35 * H)];
//    self.SmallHeadOneLabelContent.backgroundColor = [UIColor whiteColor];
    self.SmallHeadOneLabelContent.font = [UIFont systemFontOfSize:14];
    self.SmallHeadOneLabelContent.numberOfLines = 0;
    self.SmallHeadOneLabelContent.textAlignment = NSTextAlignmentCenter;
    self.SmallHeadOneLabelContent.textColor = [UIColor whiteColor];
    [self.headViewSmallOne addSubview:self.SmallHeadOneLabelContent];
    
    // 评论人数
    self.SmallHeadOneLabelCount = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 90 * W, 10 * H, 80 * W, 15 * H)];
//    self.SmallHeadOneLabelCount.backgroundColor = [UIColor whiteColor];
    self.SmallHeadOneLabelCount.font = [UIFont systemFontOfSize:12];
    self.SmallHeadOneLabelCount.textAlignment = NSTextAlignmentCenter;
    self.SmallHeadOneLabelCount.textColor = [UIColor whiteColor];
    [self.headViewSmallOne addSubview:self.SmallHeadOneLabelCount];
    
    if (self.arrAllHeader.count > 0 && self.arrAllHeader.count <= 2) {
        
        // headerOne
        // 背景赋值
        [backGroundImageView sd_setImageWithURL:[NSURL URLWithString:[self.arrAllHeader[0] ref_campaign].thumb.raw] placeholderImage:[UIImage imageNamed:@"mask-gallery.png"]];
        
        // 题目赋值
        self.SmallHeadOneLabelTitle.text = [self.arrAllHeader[0] ref_campaign].title;
        
        // 头像赋值
        Meow *meow = self.arrAllHeader[0];
        User *user = meow.user;
        [self.SmallHeadOneUserImgView sd_setImageWithURL:[NSURL URLWithString:user.avatar_url]  placeholderImage:[UIImage imageNamed:@"mask-gallery.png"]];
        self.SmallHeadOneUserImgView.clipsToBounds = YES;
        
        // 名字赋值
        self.SmallHeadOneLabelName.text = [NSString stringWithFormat:@"%@ 说", user.name];
        
        // 内容赋值
        self.SmallHeadOneLabelContent.text = [self.arrAllHeader[0] ref_campaign].descriptionRef_campaign;
        
        // 参加人数赋值
        self.SmallHeadOneLabelCount.text = [NSString stringWithFormat:@"%@人参加", [self.arrAllHeader[0] ref_campaign].participant_num];

    } else if (self.arrAllHeader.count > 2) {
        int i = 1;
        // headerOne
//        // 背景赋值
        [backGroundImageView sd_setImageWithURL:[NSURL URLWithString:[self.arrAllHeader[0 + i * 2] thumb].raw] placeholderImage:[UIImage imageNamed:@"mask-gallery.png"]];
        i++;
    }
}

#pragma mark - headViewSmallTwo控件

- (void)createHeadViewSmallTwo {
    // 题目
    self.smallHeadTwoLabelTitle = [[UILabel alloc] initWithFrame:CGRectMake(80 * W, 20 * H, WIDTH - 160 * W, 40 * H)];
//    self.smallHeadTwoLabelTitle.backgroundColor = [UIColor whiteColor];
    self.smallHeadTwoLabelTitle.font = [UIFont systemFontOfSize:22];
    self.smallHeadTwoLabelTitle.textAlignment = NSTextAlignmentCenter;
    [self.headViewSmallTwo addSubview:self.smallHeadTwoLabelTitle];
    
    // button
    self.smallHeadTwoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.smallHeadTwoButton.frame = CGRectMake(0, 80 * W, WIDTH, 30 * H);
//    self.smallHeadTwoButton.backgroundColor = [UIColor whiteColor];
    [self.smallHeadTwoButton setImage:[UIImage imageNamed:@"MONOSpecial.png"] forState:UIControlStateNormal];
    [self.headViewSmallTwo addSubview:self.smallHeadTwoButton];
    
    // 收藏人数
    self.smallHeadTwoLabelCollectionPerson = [[UILabel alloc] initWithFrame:CGRectMake(130 * W, 140 * H, 80 * W, 20 * H)];
//    self.smallHeadTwoLabelCollectionPerson.backgroundColor = [UIColor whiteColor];
    self.smallHeadTwoLabelCollectionPerson.font = [UIFont systemFontOfSize:12];
    self.smallHeadTwoLabelCollectionPerson.textColor = [UIColor grayColor];
    [self.headViewSmallTwo addSubview:self.smallHeadTwoLabelCollectionPerson];
    
    
    // 内容数
    self.smallHeadTwoLabelContentCount = [[UILabel alloc] initWithFrame:CGRectMake(220 * W, 140 * H, 80 * W, 20 * H)];
//    self.smallHeadTwoLabelContentCount.backgroundColor = [UIColor whiteColor];
    self.smallHeadTwoLabelContentCount.font = [UIFont systemFontOfSize:12];
    self.smallHeadTwoLabelContentCount.textColor = [UIColor grayColor];
    [self.headViewSmallTwo addSubview:self.smallHeadTwoLabelContentCount];
    
    if (self.arrAllHeader.count > 0) {
        // headerTwo
        // title赋值
        self.smallHeadTwoLabelTitle.text = [self.arrAllHeader[1] title];
        
        // 收藏人数
        self.smallHeadTwoLabelCollectionPerson.text = [NSString stringWithFormat:@"%@人收藏" ,[self.arrAllHeader[1] fav_num]];
        
        // 内容数
        self.smallHeadTwoLabelContentCount.text = [NSString stringWithFormat:@"%@篇内容", [self.arrAllHeader[1] content_num]];
    }
}


- (void)setLunBoTuArray:(NSMutableArray *)arr {
    // 轮播图赋值
    WheelView *wheel = [[WheelView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 200 * H) DataArray:arr];
    [self.scrollView addSubview:wheel];
    
}
- (void)getItemArr:(NSMutableArray *)arrAll {
    
    self.arrAll = arrAll;
    [self.collectionView reloadData];
    
}
- (void)getHeaderAllArr:(NSMutableArray *)arr {

    self.arrAllHeader = arr;
    [self.collectionView reloadData];
    [self.collectionView endEditing:YES];
}

// 下拉刷新和上拉加载数据
- (void)updateData {
    // 下拉刷新
    self.collectionView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateData" object:nil];
    }];
    
    // 上拉加载
    self.collectionView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadData" object:nil];
    }];
}
@end
