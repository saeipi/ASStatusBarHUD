//
//  ViewController.m
//  ASStatusBarHUD
//
//  Created by saeipi on 16/2/20.
//  Copyright © 2016年 saeipi. All rights reserved.
//

#import "ViewController.h"
#import "ASStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)success {
    [ASStatusBarHUD showSuccess:@"发布成功"];
}
- (IBAction)error:(id)sender {
    [ASStatusBarHUD showError:@"加载错误"];
}

- (IBAction)load:(id)sender {
    [ASStatusBarHUD showLoad:@"加载中"];
}
- (IBAction)hide:(id)sender {

    [ASStatusBarHUD hide];
}
- (IBAction)messageCustom:(id)sender {
    
    [ASStatusBarHUD showCustomMessage:@"今天天气正好"];
}
-(void)test {
    NSLog(@"test");
}
-(void)test2 {
    NSLog(@"test");
}
@end
