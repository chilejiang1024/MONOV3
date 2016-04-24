//
//  YellowButtonSubView.m
//  MONOV3
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "YellowButtonSubView.h"
#import "YellowBtnTableViewCellFirst.h"
#import "YellowBtnTableViewCellSecond.h"
#import "MeowsModel.h"

@interface YellowButtonSubView ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *table;
@property (nonatomic, retain) NSMutableArray *contentArray;
@end

@implementation YellowButtonSubView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self createView]; 
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)createView{
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 100) style:UITableViewStylePlain];
    
    [self addSubview:self.table];
    
    self.table.delegate = self;
    
    self.table.dataSource = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(relodataForSubView:) name:@"getDataForSubView" object:nil];
}

- (void)relodataForSubView:(NSNotification *)notification{
    self.contentArray = [notification.userInfo objectForKey:@"arrayMeows"];
    [_table reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID1 = @"class1";
    static NSString *ID2 = @"class2";
    YellowBtnTableViewCellFirst *cell1 = [tableView dequeueReusableCellWithIdentifier:ID1];
    YellowBtnTableViewCellSecond *cell2 = [tableView dequeueReusableCellWithIdentifier:ID2];
    MeowsModel *meow = _contentArray[indexPath.row];
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
    if ([self.contentArray[indexPath.row] pics].count < 1) {
        return [UIScreen mainScreen].bounds.size.height / 2.5;
    } else {
        return [UIScreen mainScreen].bounds.size.height / 1.5;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
