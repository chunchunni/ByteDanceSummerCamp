//
//  ViewController.m
//  Weather
//
//  Created by PURE on 2021/7/16.
//  Copyright © 2021 PURE. All rights reserved.
//

#import "ViewController.h"
#import "Weather.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
}

- (IBAction)buttonPressed:(UIButton *)sender
{
    NSString *plainText = @"HelloWorld";
    _statusLabel.text = plainText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//加载网络数据
-(void)loadData
{
    //根据请求，加载网络数据
    NSURL *url=[NSURL URLWithString:@"https://www.tianqiapi.com/free/week?appid=52253853&appsecret=EIq5erZY"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url
                                           cachePolicy:0 timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                //将二进制数据转换为字典
                NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                Weather *model = [[Weather alloc]init];
                model.cityName = result[@"city"];
                model.updateTime = result[@"update_time"];
                model.sevenDays = result[@"data"];
                NSLog(@"%@ %@",model.cityName,model.updateTime);
                /*
                NSLog(@"%@市 时间%@ 天气%@ 天气ENG%@ 平均温度%@ 最高温度%@ 最低温度%@ 风向%@ 风力%@ 风速%@ 空气%@",
                      result[@"city"],
                      result[@"update_time"],
                      result[@"wea"],
                      result[@"wea_img"],
                      result[@"tem"],
                      result[@"tem_day"],
                      result[@"tem_night"],
                      result[@"win"],
                      result[@"win_speed"],
                      result[@"win_meter"],
                      result[@"air"]
                      );*/
            }] resume];
    
}

@end

