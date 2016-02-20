//
//  ASStatusBarHUD.h
//  ASStatusBarHUD
//
//  Created by saeipi on 16/2/20.
//  Copyright © 2016年 saeipi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ASStatusBarHUD : NSObject

///显示信息
+ (void)showCustomMessage:(NSString *)msg;
///显示成功信息
+ (void)showSuccess:(NSString *)msg;
///显示错误信息
+ (void)showError:(NSString *)msg;
///显示正在处理信息
+ (void)showLoad:(NSString *)msg;
///隐藏
+ (void)hide;

///显示信息 + 图片
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

@end
