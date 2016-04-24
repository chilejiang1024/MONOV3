//
//  YellowButtonSubViewControlerViewController.m
//  MONOV3
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "YellowButtonSubViewControlerViewController.h"
#import "AFNetworking.h"
#import "TagsModel.h"
#import "MeowsModel.h"
#import "YellowButtonSubView.h"
@interface YellowButtonSubViewControlerViewController ()
@property (nonatomic, copy) NSString *dataNumber;
@end

@implementation YellowButtonSubViewControlerViewController

- (instancetype)initWithDataNumber:(NSString *)dataNumber{
    self = [super init];
    if (self) {
        self.dataNumber = dataNumber;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createData];
    [self createSubView];
}

- (void)createSubView{
    YellowButtonSubView *view = [[YellowButtonSubView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:view];
}

- (void)createData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"mmmono.com" forHTTPHeaderField:@"Host"];
    [manager.requestSerializer setValue:@"c3a2c55eebe811e597b1525400097b5b" forHTTPHeaderField:@"HTTP-AUTHORIZATION"];
    NSString *path = [NSString stringWithFormat:@"http://mmmono.com/api/v3/domain_category/%@/?", self.dataNumber];
    [manager GET:path parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray *arrayTags = [TagsModel getTagsModelArray:responseObject];
        NSMutableArray *arrayMeows = [MeowsModel getMeowsModelArray:responseObject];
        NSDictionary *dicArr = @{@"arrayTags":arrayTags, @"arrayMeows":arrayMeows};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getDataForSubView" object:@"yes" userInfo:dicArr];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
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
