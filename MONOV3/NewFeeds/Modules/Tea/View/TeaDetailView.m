//
//  TeaDetail.m
//  MONOV3
//
//  Created by JiangChile on 16/3/25.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "TeaDetailView.h"
#import "BaseTableView.h"

#import "TeaDetailModel.h"

#import "UIImageView+WebCache.h"

#import "BaseTableView.h"
#import "BaseTableViewCell.h"

#import "MONOTools.h"
#import "MeowCellFactory.h"

@interface TeaDetailView () <UITableViewDataSource, UITableViewDelegate>

/** table view datasource */
@property (nonatomic, strong) NSMutableArray *arrayMeowModel;

@property (nonatomic, strong) TeaDetailModel *teaDetailModel;

/** 顶部显示 */
@property (nonatomic, strong) UIView *controlView;

@property (nonatomic, strong) UIButton *buttonBack;

@property (nonatomic, strong) UILabel *labelTitle;

@end


@implementation TeaDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}

- (void)setTeaDetailModel:(TeaDetailModel *)teaDetailModel {
    _teaDetailModel = teaDetailModel;
    self.arrayMeowModel = _teaDetailModel.entity_list;
    [self.tableView reloadData];
    
    
    
}

- (void)createView {
    self.backgroundColor = MONO_COLOR_LIGHT;
    [self createTableView];
    [self createControlView];
}

#pragma mark - 顶部导航栏

- (void)createControlView {
    self.controlView = [UIView.alloc initWithFrame:CGRectMake(0, 0, WIDTH, 70)];
    self.controlView.alpha = 0.5;
    self.controlView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.controlView];
    
    self.buttonBack = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonBack.frame = CGRectMake(20, 30, 20, 40);
    [self.buttonBack setImage:[UIImage imageNamed:@"icon-arrow-left-white"] forState:UIControlStateNormal];
    [self.buttonBack addTarget:self action:@selector(dismissThisView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buttonBack];
    
    self.labelTitle = [UILabel.alloc initWithFrame:CGRectMake(WIDTH - 50, 30, WIDTH - 100, 30)];
    self.labelTitle.textColor = [UIColor whiteColor];
    self.labelTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.labelTitle];
    
}

#pragma mark - table view & datasource & delegate

- (void)createTableView {
    BaseTableView *tableView = [[BaseTableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView = tableView;
    [self addSubview:self.tableView];
}     

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayMeowModel.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MONOTools getHeightForCellWithMeowModel:self.arrayMeowModel[indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView.alloc initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
    
    UIImageView *imageViewBG = [UIImageView.alloc initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
    [imageViewBG sd_setImageWithURL:[NSURL URLWithString:self.teaDetailModel.bg_img_url]];
    imageViewBG.contentMode = UIViewContentModeTop;
    imageViewBG.clipsToBounds = YES;
    
    UIImageView *imageViewTeaTitle = [UIImageView.alloc initWithFrame:CGRectMake(50, 40, 120, 40)];
    if (self.teaDetailModel.kind == 0) {
        imageViewTeaTitle.image = [UIImage imageNamed:@"icon-morning-tea-white"];
    } else {
        imageViewTeaTitle.image = [UIImage imageNamed:@"icon-afternoon-tea-white"];
    }
    
    UILabel *labelDate = [UILabel.alloc initWithFrame:CGRectMake(WIDTH - 200, 100, 200, 40)];
    labelDate.textColor = [UIColor whiteColor];
    labelDate.font = [UIFont systemFontOfSize:30.f];
    labelDate.text = self.teaDetailModel.release_date;
    
    [view addSubview:imageViewBG];
    [view addSubview:imageViewTeaTitle];
    [view addSubview:labelDate];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Meow *meow = self.arrayMeowModel[indexPath.row];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@", meow.meow_type]];
    if (!cell) {
        cell = [[MeowCellFactory manager] createCellWithModel:self.arrayMeowModel[indexPath.row]];
    } else {
        cell.model = self.arrayMeowModel[indexPath.row];
    }
    return cell;
}

#pragma mark - scroll view delegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
}

#pragma mark - button selector 

- (void)dismissThisView:(UIButton *)sender {
    [[MONOTools shareMONOTools] dismissView:self AndRemoveFromSuperViewWithMONOAnimator:MONOAnimatorRight];
}

@end
