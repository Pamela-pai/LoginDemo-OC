//
//  LPContactViewController.m
//  登录注册demo-LP
//
//  Created by 刘湃 on 2017/2/10.
//  Copyright © 2017年 刘湃. All rights reserved.
//

#import "LPContactViewController.h"
#import "MBProgressHUD+XMG.h"

@interface LPContactViewController ()<UIActionSheetDelegate>

@end

@implementation LPContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSLog(@"%@",self.accountName);
    //设置标题
    self.title = [NSString stringWithFormat:@"%@的通讯录",self.accountName];
    
}


//注销按钮点击
- (IBAction)loginOut:(id)sender {
    
    //1.创建控制器
    UIAlertController *aletVC = [UIAlertController alertControllerWithTitle:@"确定要退出嘛..." message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //2.创建按钮
    //只能有一个UIAlertActionStyleCancel样式
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮时会调用
        
    }];
    
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    
    //3.把按钮添加到控制器身上
    [aletVC addAction:action];
    [aletVC addAction:action1];
    
    //4.弹框
    [self presentViewController:aletVC animated:YES completion:nil];
    
    
    
}

@end
