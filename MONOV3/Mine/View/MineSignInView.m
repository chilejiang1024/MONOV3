//
//  MineSignInView.m
//  MONOV3
//
//  Created by JiangChile on 16/3/23.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "MineSignInView.h"
#import "MONOTools.h"
@interface MineSignInView ()
@property (nonatomic, retain) UIView *login;
@property (nonatomic, retain) UIButton *qqBtn;
@property (nonatomic, retain) UIButton *weiboBtn;
@property (nonatomic, retain) UIButton *weixinBtn;
@property (nonatomic, retain) UIScrollView *userProtocolScrollView;
@property (nonatomic, retain) UIButton *back;
@end

@implementation MineSignInView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}

- (void)createView {
    UIImageView *imageViewSignIn = [UIImageView.alloc init];
    UIImage *imageSignIn  = [UIImage imageNamed:@"SignIn"];
    imageViewSignIn.image = imageSignIn;
    imageViewSignIn.frame = CGRectMake(0, 0, WIDTH, imageSignIn.size.height / (imageSignIn.size.width / WIDTH));
    [self addSubview:imageViewSignIn];
    
    UIButton *buttonSignIn = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonSignIn.frame = CGRectMake(WIDTH / 2 - 50, HEIGHT / 2 - 70, 100, 100);
    buttonSignIn.layer.cornerRadius = 50;
    [buttonSignIn addTarget:self action:@selector(clickButtonSignIn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buttonSignIn];
}

- (void)clickButtonSignIn:(UIButton *)sender {
    [self loginMethod];
}

- (void)loginMethod{
    _login = [[UIView alloc] initWithFrame:self.bounds];
    _login.backgroundColor = [UIColor blackColor];
    _login.alpha = 0.8;
    [self addSubview:_login];
    UIButton *close = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width * 7 / 8 - 45, self.frame.size.height / 5, 40, 40)];
    [close setBackgroundImage:[UIImage imageNamed:@"login_btn_close"] forState:UIControlStateNormal];
    [_login addSubview:close];
    [close addTarget:self action:@selector(closeSubView) forControlEvents:UIControlEventTouchUpInside];
    [self createLoginBackGroundLab];
    [self createLoginBtn];
}

- (void)createLoginBackGroundLab{
    UILabel *loginMONO = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 8, self.frame.size.height * 0.8 / 5, self.frame.size.width * 3 / 4, self.frame.size.height / 22)];
    loginMONO.text = @"登陆MONO";
    loginMONO.textColor = [UIColor whiteColor];
    loginMONO.font = [UIFont systemFontOfSize:20];
    [_login addSubview:loginMONO];
    
    UILabel *chooseMethod = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 8, self.frame.size.height * 0.8 / 5 + self.frame.size.height / 22, self.frame.size.width * 3 / 4, self.frame.size.height / 33)];
    chooseMethod.text = @"你可以用以下方式登陆";
    chooseMethod.textColor = [UIColor whiteColor];
    chooseMethod.font = [UIFont systemFontOfSize:15];
    [_login addSubview:chooseMethod];
    
}

- (void)createLoginBtn{
    
    _qqBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 8, self.frame.size.height * 1.5 / 5, self.frame.size.width * 3 / 4, self.frame.size.height / 11)];
    [_qqBtn setImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
    [self addSubview:_qqBtn];
    
    _weiboBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 8, self.frame.size.height * 1.5 / 5 + self.frame.size.height / 11 + self.frame.size.height / 25, self.frame.size.width * 3 / 4, self.frame.size.height / 11)];
    [_weiboBtn setImage:[UIImage imageNamed:@"weibo"] forState:UIControlStateNormal];
    [self addSubview:_weiboBtn];
    
    _weixinBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 8, self.frame.size.height * 1.5 / 5 + 2  * (self.frame.size.height / 11) + self.frame.size.height / 12.5, self.frame.size.width * 3 / 4, self.frame.size.height / 11)];
    [_weixinBtn setImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
    [self addSubview:_weixinBtn];
    
    _qqBtn.tag = 1001;
    _weiboBtn.tag = 1002;
    _weixinBtn.tag = 1003;
    [_qqBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_weiboBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_weixinBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableAttributedString *userProtocolTitle = [[NSMutableAttributedString alloc] initWithString:@"登录后意味着你同意MONO的《使用协议》"];
    [userProtocolTitle setAttributes:@{NSForegroundColorAttributeName : MONO_COLOR} range:NSMakeRange(14, 6)];
    [userProtocolTitle setAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} range:NSMakeRange(0, 14)];
    UIButton *userProtocol = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width / 8, self.frame.size.height * 1.5 / 5 + 3  * (self.frame.size.height / 11) + self.frame.size.height / 25 * 3, self.frame.size.width * 3 / 4, self.frame.size.height / 33)];
    [userProtocol setAttributedTitle:userProtocolTitle forState:UIControlStateNormal];
    userProtocol.titleLabel.font = [UIFont systemFontOfSize:12];
    [userProtocol addTarget:self action:@selector(createUserProtocolScroller) forControlEvents:UIControlEventTouchUpInside];
    [_login addSubview:userProtocol];
}

- (void)clickBtn:(UIButton *)sender{
    [self.delegate clickLoginType:sender.tag];
}

- (void)createUserProtocolScroller{
    _back = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 30, 15, 30, 30)];
    [_back setImage:[UIImage imageNamed:@"login_btn_close"] forState:UIControlStateNormal];
    [_back addTarget:self action:@selector(backMethod) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_back];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"procotol" ofType:@"txt"];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    CGFloat height = [MONOTools getHeightLabel:str Weight:self.frame.size.width - 40 FontOfSize:17];
    
    _userProtocolScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width, self.frame.size.height - 80)];
    _userProtocolScrollView.backgroundColor = [UIColor whiteColor];
    _userProtocolScrollView.contentSize = CGSizeMake(self.frame.size.width, height);
    [self addSubview:_userProtocolScrollView];
    UILabel *labProtocol = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.frame.size.width - 40, height)];
    labProtocol.numberOfLines = 0;
    labProtocol.text = str;
    [_userProtocolScrollView addSubview:labProtocol];
}

- (void)backMethod{
//    NSLog(@"--------");
    [_userProtocolScrollView removeFromSuperview];
    [_back removeFromSuperview];
}

- (void)closeSubView{
    [_login removeFromSuperview];
    [_qqBtn removeFromSuperview];
    [_weixinBtn removeFromSuperview];
    [_weiboBtn removeFromSuperview];
}

@end
