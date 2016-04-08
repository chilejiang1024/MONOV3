//
//  YellowButtonView.m
//  MONOV3
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "YellowButtonView.h"
#import "FindViewCatalogueModel.h"
#import "MeowsModel.h"
#import "YellowBtnTableViewCellFirst.h"
#import "YellowBtnTableViewCellSecond.h"

@interface YellowButtonView ()<UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *table;
@property (nonatomic, retain) UIScrollView *titleScroll;
@property (nonatomic, retain) UIScrollView *contentScroll;
@property (nonatomic, assign) NSInteger arrCount;
@property (nonatomic, retain) NSMutableArray *arrayContent;

@end

@implementation YellowButtonView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createYellowButtonView];
    }
    return self;
}

- (void)createYellowButtonView{
    self.backgroundColor = [UIColor whiteColor];
    [self createSearchBar];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(relodata:) name:@"firstLoadData" object:nil];
}
- (void)relodata:(NSNotification *)notification{
    self.arrayContent = [notification.userInfo objectForKey:@"arrayMeows"];
    [_table reloadData];
}

- (void)createTitleScrollView:(NSMutableArray *)array{
    _arrCount = array.count;
    _titleScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, self.frame.size.width, 30)];
    _titleScroll.showsHorizontalScrollIndicator = NO;
    _titleScroll.contentSize = CGSizeMake(60 * array.count, 30);
    for (int i = 0; i < array.count; i++) {
        UIButton *buttonTitle = [[UIButton alloc] initWithFrame:CGRectMake(i * 60, 0, 60, 30)];
        FindViewCatalogueModel *model = array[i];
        [buttonTitle setTitle:model.name forState:UIControlStateNormal];
        buttonTitle.titleLabel.font = [UIFont systemFontOfSize:15];
        [buttonTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        buttonTitle.tag = 1100 + i;
        [buttonTitle addTarget:self action:@selector(clickTitleButton:) forControlEvents:UIControlEventTouchUpInside];
        [_titleScroll addSubview:buttonTitle];
    }
    [self addSubview:_titleScroll];
    [self createContentScrollView];
}

- (void)clickTitleButton:(UIButton *)sender{
    static NSInteger buttonId = 1100;
    UIButton *btn = [self viewWithTag:buttonId];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    buttonId = sender.tag;
    [sender setTitleColor:MONO_COLOR forState:UIControlStateNormal];
}

- (void)createContentScrollView{
    _contentScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, self.frame.size.width, self.frame.size.height - 100)];
    _contentScroll.contentSize = CGSizeMake(_arrCount * self.frame.size.width, self.frame.size.height - 100);
    _contentScroll.pagingEnabled = YES;
    _contentScroll.delegate = self;
    _contentScroll.bounces = NO;
    [self createContentView];
    [self addSubview:_contentScroll];
}

- (void)createContentView{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 120)];
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, contentView.frame.size.width, contentView.frame.size.height)];
    _table.delegate = self;
    _table.dataSource = self;
    [contentView addSubview:_table];
    [contentView setBackgroundColor:[UIColor redColor]];
    [_contentScroll addSubview:contentView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayContent.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID1 = @"class1";
    static NSString *ID2 = @"class2";
    YellowBtnTableViewCellFirst *cell1 = [tableView dequeueReusableCellWithIdentifier:ID1];
    YellowBtnTableViewCellSecond *cell2 = [tableView dequeueReusableCellWithIdentifier:ID2];
    MeowsModel *meow = _arrayContent[indexPath.row];
    NSString *type = [NSString stringWithFormat:@"%@", meow.meow_type];
    if ([type isEqualToString:@"4"]) {
        if (cell1 == nil) {
            cell1 = [[YellowBtnTableViewCellFirst alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID1];
        }
        cell1.meows = meow;
        return cell1;
    } else {
        if (cell2 == nil) {
            cell2 = [[YellowBtnTableViewCellSecond alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID2];
        }
        cell2.meow = meow;
        return cell2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.arrayContent[indexPath.row] pics].count < 1) {
        return [UIScreen mainScreen].bounds.size.height / 2.5;
    } else {
        return [UIScreen mainScreen].bounds.size.height / 1.5;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _contentScroll) {
        static CGFloat indexBefore = 0;
        CGFloat index = self.contentScroll.contentOffset.x / self.frame.size.width;
        UIButton *buttonBefore = [self viewWithTag:1100 + indexBefore];
        [buttonBefore setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        indexBefore = index;
        UIButton *button = [self viewWithTag:1100 + index];
        [button setTitleColor:MONO_COLOR forState:UIControlStateNormal];
        [self titleScrollViewContentOffset:index];
    }
}

- (void)titleScrollViewContentOffset:(CGFloat)index{
    CGFloat contentOffSet = -170 + index * 60;
    if (contentOffSet < 0) {
        [self.titleScroll setContentOffset:CGPointMake(0, 0) animated:YES];
    } else if (contentOffSet > _titleScroll.contentSize.width - self.frame.size.width) {
        [self.titleScroll setContentOffset:CGPointMake(_titleScroll.contentSize.width - self.frame.size.width, 0) animated:YES];
    } else {
    
    [self.titleScroll setContentOffset:CGPointMake( -170 + index * 60, 0) animated:YES];
    }
}

- (void)createSearchBar{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(30, 20, self.frame.size.width - 30 * 3, 30)];
    searchBar.placeholder = @"搜索内容、站、专题";
    [self addSubview:searchBar];
    searchBar.barTintColor = [UIColor whiteColor];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 45, 27.5, 15, 15)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"cpprofile_btn_barclose_active"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backBtn];
}

- (void)backBtn{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"back" object:@"yes"];
}

@end
