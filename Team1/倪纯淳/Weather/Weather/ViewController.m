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
//_statusLabel.text = plainText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showWeather:(Weather *) model
{
    _statusLabelCity.text = model.cityName;
    _statusLabelDate.text = model.updateTime;
}


//加载网络数据
-(void)loadData
{
    //根据请求，加载网络数据
    NSURL *url=[NSURL URLWithString:@"https://www.tianqiapi.com/free/week?appid=52253853&appsecret=EIq5erZY"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url
                                           cachePolicy:0 timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sharedSession];
    Weather *model = [[Weather alloc]init];
    [[session dataTaskWithURL:url
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                //将二进制数据转换为字典
                NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                model.cityName = result[@"city"];
                model.updateTime = result[@"update_time"];
                model.sevenDays = result[@"data"];
                NSLog(@"%@ %@",model.cityName,model.updateTime);
                [self showWeather:model];
                
            }] resume];
    
}



@end

