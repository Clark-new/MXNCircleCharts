//
//  ViewController.m
//  环形图
//
//  Created by 孟宪楠 on 2018/1/8.
//  Copyright © 2018年 孟宪楠. All rights reserved.
//

#import "ViewController.h"
#import "MXNCircleCharts.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}
#pragma mark - 设置界面
- (void)setupUI {
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    CGFloat chartWidth = self.view.frame.size.width * 0.7;
    CGFloat x = (width - chartWidth) / 2;
    CGFloat y = (height - chartWidth) / 2;

    MXNCircleCharts *circle = [[MXNCircleCharts alloc] initWithFrame:CGRectMake(x, y, chartWidth, chartWidth) withMaxValue:100 value:85];
    
    circle.valueTitle = @"85%";
    circle.valueColor = [UIColor blackColor];

    circle.title = @"我的掌握度";
    circle.titleColor = [UIColor blackColor];
    
    circle.colorArray = @[[self colorWithHexString:@"#00C7B5" alpha:1],[self colorWithHexString:@"#ff2366" alpha:1]];
    
    circle.locations = @[@0.15,@0.85];
    
    [self.view addSubview:circle];
    
}
#pragma mark 设置16进制颜色
- (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
