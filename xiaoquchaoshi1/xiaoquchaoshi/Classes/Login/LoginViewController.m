//
//  LoginViewController.m
//  xiaoquchaoshi
//
//  Created by caohaifeng on 8/26/16.
//  Copyright © 2016 大连友商科技有限公司. All rights reserved.
//

#import "LoginViewController.h"

#import "BasicTabBarController.h"

@interface LoginViewController ()

@property(nonatomic,strong) UITextField *usernameTextField;
@property(nonatomic,strong) UITextField *passwordTextField;
@property(nonatomic,strong) UIButton    *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"小区超市";
    
    [self.view addSubview:self.usernameTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
    
}

#pragma mark -- 懒加载
#pragma mark -- usernameTextField
- (UITextField *)usernameTextField {
    if (_usernameTextField == nil) {
        _usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 74, kSCREEN_WIDTH-20, 50)];
        _usernameTextField.placeholder=@"请输入账号";
        _usernameTextField.borderStyle=UITextBorderStyleRoundedRect;
    }
    return _usernameTextField;
}

#pragma makr -- passwordTextField
- (UITextField *)passwordTextField {
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 134, kSCREEN_WIDTH-20, 50)];
        _passwordTextField.placeholder=@"请输入密码";
        _passwordTextField.borderStyle=UITextBorderStyleRoundedRect;
    }
    return _passwordTextField;
}

#pragma mark -- loginButton
- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 194, kSCREEN_WIDTH-20, 50)];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.backgroundColor=[UIColor redColor];
        [_loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

//登录按钮的点击事件
- (void)login:(UIButton *)sender {
    UIAlertController *alertVc=[UIAlertController alertControllerWithTitle:@"注意" message:@"请输入正确的账号和密码" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
    [alertVc addAction:action];
    BasicTabBarController *tvc=[BasicTabBarController new];
    if([self.usernameTextField.text isEqualToString:@"111"] && [self.passwordTextField.text isEqualToString:@"111"]){
        [self presentViewController:tvc animated:YES completion:nil];
    }else{
        [self presentViewController:alertVc animated:YES completion:nil];
    }
}

@end
