//
//  BlackButtonViewController.m
//  MONOV3
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BlackButtonViewController.h"
#import "BlackButtonView.h"
#import "AFNetworking.h"
#import "Group.h"
@interface BlackButtonViewController ()<BlackButtonDelegate>

@property (nonatomic, strong) BlackButtonView *blackButtonView;
@property (nonatomic, strong) NSMutableArray *arrGroupModel;

@end

@implementation BlackButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createBlackView];
    [self getData];
}

- (void)getData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"mmmono.com" forHTTPHeaderField:@"Host"];
    [manager.requestSerializer setValue:@"c3a2c55eebe811e597b1525400097b5b" forHTTPHeaderField:@"HTTP-AUTHORIZATION"];
    [manager GET:@"http://mmmono.com/api/v3/explore/mod/30/shuffled?" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.arrGroupModel = [NSMutableArray array];
        NSArray *arrEntity_list = [responseObject objectForKey:@"entity_list"];
        for (NSDictionary *dict in arrEntity_list) {
            NSDictionary *dicGroup = [dict objectForKey:@"group"];
            Group *groupModel = [[Group alloc] initWithDic:dicGroup];
            [self.arrGroupModel addObject:groupModel];
        }
        [self.blackButtonView passArr:self.arrGroupModel];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}
- (void)createBlackView {
    self.blackButtonView = [[BlackButtonView alloc] initWithFrame:CGRectMake(0, 20 * H, WIDTH, HEIGHT - 20 * H)];
//    blackView.backgroundColor = [UIColor redColor];
    self.blackButtonView.delegate = self;
    [self.view addSubview:self.blackButtonView];
}


- (void)putViewController:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
