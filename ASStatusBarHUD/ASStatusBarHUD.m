//
//  ASStatusBarHUD.m
//  ASStatusBarHUD
//
//  Created by saeipi on 16/2/20.
//  Copyright © 2016年 saeipi. All rights reserved.
//

#import "ASStatusBarHUD.h"

#define ASMessageFont [UIFont systemFontOfSize:12]
@implementation ASStatusBarHUD

///定时器
static NSTimer *astimer;
///窗口
static UIWindow *aswindow;

///消息的动画时间
static CGFloat const ASAnimationDuration = 0.25;
///消息的停留时间
static CGFloat const ASDuration = 2;

///显示窗口
+ (void)showWindow {
    ///frame数据
    CGFloat windowHeight = 20;
    CGRect frame = CGRectMake(0, - windowHeight, [UIScreen mainScreen].bounds.size.width, windowHeight);
    
    ///显示窗口
    aswindow.hidden = YES;
    aswindow = [[UIWindow alloc] init];
    aswindow.backgroundColor = [UIColor lightGrayColor];
    
    ///窗口的层级
    aswindow.windowLevel = UIWindowLevelAlert;
    aswindow.frame = frame;
    aswindow.hidden = NO;
    
    ///执行动画
    frame.origin.y = 0;
    [UIView animateWithDuration:ASAnimationDuration animations:^{
        aswindow.frame = frame;
    }];
    
}
///显示信息 + 图片
+ (void)showMessage:(NSString *)msg image:(UIImage *)image {
    ///停止定时
    [astimer invalidate];
    
    ///显示窗口
    [self showWindow];
    
    ///添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    
    if (image) {///如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    
    button.frame = aswindow.bounds;
    [aswindow addSubview:button];
    
    ///scheduledTimerWithTimeInterval:会自动加载到runloop中
    ///repeats:是否重复调用
    astimer = [NSTimer scheduledTimerWithTimeInterval:ASDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
    
//    [ASStatusBarHUD cancelPreviousPerformRequestsWithTarget:self selector:@selector(cancelAction) object:nil];
//    ASStatusBarHUD *cancel = [[ASStatusBarHUD alloc] init];
//    [cancel performSelector:@selector(cancel) withObject:nil afterDelay:2.0];
}

+ (void)cancelAction {
    NSLog(@"取消之前正在执行的事件");
    aswindow = nil;
}

- (void)cancel {
    NSLog(@"取消之前正在执行的事件");
    aswindow = nil;
}

///显示信息
+ (void)showCustomMessage:(NSString *)msg {
    [self showMessage:msg image:nil];
}
///显示成功信息
+ (void)showSuccess:(NSString *)msg {
    [self showMessage:msg image:[UIImage imageNamed:@"ASStatusBarHUD.bundle/check"]];
    
}
///显示错误信息
+ (void)showError:(NSString *)msg {
    
    [self showMessage:msg image:[UIImage imageNamed:@"ASStatusBarHUD.bundle/Error"]];
}
///显示正在处理信息
+ (void)showLoad:(NSString *)msg {
    ///停止定时器
    [astimer invalidate];
    astimer = nil;
    ///显示窗口
    [self showWindow];
    
    UILabel *lable = [[UILabel alloc] init];
    lable.frame = aswindow.bounds;
    lable.font = ASMessageFont;
    ///文字居中对齐
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = msg;
    lable.textColor = [UIColor whiteColor];
    [aswindow addSubview:lable];
    ///加载圈圈
    UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadView startAnimating];
    
    ///文字的宽度
    CGFloat msgWidth = [msg sizeWithAttributes:@{NSFontAttributeName:ASMessageFont}].width;
    ///计算加载圈圈的中心
    CGFloat centerX = (aswindow.frame.size.width - msgWidth) * 0.5 - 20;
    CGFloat centerY = aswindow.frame.size.height * 0.5;
    
    loadView.center = CGPointMake(centerX, centerY);
    
    [aswindow addSubview:loadView];
}
///隐藏
+ (void)hide {
    
    ///frame数据
    CGRect frame = aswindow.frame;
    frame.origin.y -= frame.size.height;
//    CGRect frame = CGRectMake(0, - windowHeight, [UIScreen mainScreen].bounds.size.width, windowHeight);
    
    [UIView animateWithDuration:ASAnimationDuration animations:^{
        
        aswindow.frame = frame;
    } completion:^(BOOL finished) {
        
        aswindow = nil;
        
        ///销毁定时器
        astimer = nil;
    }];
}

@end
