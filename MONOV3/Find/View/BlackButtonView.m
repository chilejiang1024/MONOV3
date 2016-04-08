//
//  BlackButtonView.m
//  MONOV3
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BlackButtonView.h"
#import "BlackTableviewCell.h"
@interface BlackButtonView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arrModel;

@end

@implementation BlackButtonView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
        
    }
    return self;
}

- (void)createView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 40 * H)];
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"MONO造物主";
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 40 * W, 40 * H);
    backButton.backgroundColor = [UIColor whiteColor];
    [backButton setImage:[UIImage imageNamed:@"leftButton.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(clickBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backButton];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40 * H, WIDTH, HEIGHT - 40 * H)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    BlackTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[BlackTableviewCell alloc] initWithStyle:0 reuseIdentifier:ID];
    }
    cell.groupModel = self.arrModel[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70 * H;
}

#pragma mark - black按钮点击方法
- (void)clickBackButton:(UIButton *)sender {
    [self.delegate putViewController:sender];
}

- (void)passArr:(NSMutableArray *)arr {
    self.arrModel = arr;
    [self.tableView reloadData];
}

@end
