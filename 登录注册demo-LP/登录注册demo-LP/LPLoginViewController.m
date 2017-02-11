//
//  LPLoginViewController.m
//  登录注册demo-LP
//
//  Created by 刘湃 on 2017/2/10.
//  Copyright © 2017年 刘湃. All rights reserved.
//

#import "LPLoginViewController.h"
#import "MBProgressHUD+XMG.h"
#import "LPContactViewController.h"

@interface LPLoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *accountTextF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *remPwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation LPLoginViewController

//自动跳转:通过控件直接拖线的方式进行跳转
//手动跳转:在跳转之前要去做一些处理工作. 必须得要执行performSegueWithIdentifier:才能跳转

//dispatch_after_GCD:延迟多少秒执行任务.
- (IBAction)loginClick:(id)sender {
    
    [MBProgressHUD showMessage:@"正在帮你努力登录...." toView:self.view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hideHUDForView:self.view];
        //用户名与密码同时正确时跳转
        if ([self.accountTextF.text isEqualToString:@"lp"] && [self.pwdTextF.text isEqualToString:@"123"]) {
            //执行跳转
            [self performSegueWithIdentifier:@"contactVC" sender:nil];
            
        }else {
            //提示用户输入错误
            [MBProgressHUD showError:@"输入错误"];
        }
        
    });
    
    
}

//数据的顺传:从上一级传递数据给下一级
//1.在数据接收的控制器当中定义属性准备接收数据
//2.在数据的当前控制器(LPLoginViewController)中.获取目标控制器(数据接收的控制器LPContactViewController)
//3.给目标控制器中的对应属性赋值.


//在执行跳转之前,会调用一个方法prepareForSegue:
//在此方法当中可以获取要跳转的控制器
//可以给要跳转的控制器传递一些数据
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //获取源控制器(当前的控制器)
    UIViewController *sourceVC = segue.sourceViewController;
    //获取目标控制器(箭头指向的控制器,要跳转的控制器)
    LPContactViewController *desVC = segue.destinationViewController;
    //NSLog(@"%@-%@",sourceVC,desVC);
    desVC.accountName = self.accountTextF.text;
    
}



- (IBAction)registerClick:(id)sender {
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.accountTextF.delegate = self;
    //self.pwdTextF.delegate = self;
    
    //UIControlEventEditingChanged
    //EditingChanged
    [self.accountTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    //设置默认登录按钮状态
    [self textChange];
    
    
}

// 当记住密码关闭时, 自动登录开关关闭
- (IBAction)remChange:(UISwitch *)sender {
    
    if (sender.on == NO) {
        //self.autoLoginSwitch.on = NO;
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
    
}

//当自动登录开关打开时,记住密码开关打开
- (IBAction)autoLoginChange:(UISwitch *)sender {
    
    if (sender.on == YES) {
        [self.remPwdSwitch setOn:YES animated:YES];
    }
    
    
    //[MBProgressHUD showMessage:@"正在帮你努力...." toView:self.view];
    
}



- (void)textChange {
    NSLog(@"self.pwdTextF = %@",self.pwdTextF.text);
    //当用户名与密码同时有值时,登录按钮才够点击,否则登录按钮不能点击.
    //    if (self.accountTextF.text.length && self.pwdTextF.text.length ) {
    //        self.loginBtn.enabled = YES;
    //    }else {
    //        self.loginBtn.enabled  = NO;
    //    }
    
    self.loginBtn.enabled = self.accountTextF.text.length && self.pwdTextF.text.length;
}



//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//
//    NSLog(@"self.pwdTextF = %@",self.pwdTextF.text);
//    //当用户名与密码同时有值时,登录按钮才够点击,否则登录按钮不能点击.
//    if (self.accountTextF.text.length > 0 && self.pwdTextF.text.length > 0) {
//        self.loginBtn.enabled = YES;
//    }else {
//        self.loginBtn.enabled  = NO;
//    }
//
//    return YES;
//
//   
//}



@end
