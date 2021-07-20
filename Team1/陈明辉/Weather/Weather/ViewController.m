//
//  ViewController.m
//  Weather
//
//  Created by halo on 2021/7/16.
//  Copyright © 2021 PURE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//加载网络数据
-(void)loadData
{
    _weather = [[myWeather alloc] init];
    //根据请求，加载网络数据
    NSURL *url=[NSURL URLWithString:@"https://www.tianqiapi.com/free/week?appid=54399984&appsecret=17ebY0nX"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url
                                           cachePolicy:0 timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                //将二进制数据转换为字典
                NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                //初始化
                self.weather.city =  result[@"city"];
                self.weather.updatetime = [result[@"update_time"] substringWithRange:NSMakeRange(0, 10)];
                self.weather.temp_7 = result[@"data"];
                self.weather.wea = self.weather.temp_7[0][@"wea"];
                self.weather.wea_next = self.weather.temp_7[1][@"wea"];
                self.weather.wea_afternext = self.weather.temp_7[2][@"wea"];
                self.weather.temp_next = self.weather.temp_7[1][@"tmp_day"];
                self.weather.temp_afternext = self.weather.temp_7[2][@"tmp_day"];
                
                //显示
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.l1.text = self.weather.city;
                    self.Temp.text = self.weather.temp_7[0][@"tem_day"];
                    self.date.text = [self.weather.updatetime substringFromIndex:6];
                    self.Wea.text = self.weather.wea;
                    self.next1_wea.text = self.weather.wea_next;
                    self.next2_wea.text = self.weather.wea_afternext;
                    self.next1_temp.text = self.weather.temp_next;
                    self.next2_temp.text = self.weather.temp_afternext;
                });
            }] resume];
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [[UIImage imageNamed:@"background.png"] stretchableImageWithLeftCapWidth:left topCapHeight:top];
    [self.view addSubview:imageView];
}
- (void)processdata:(NSDictionary *)dict:(NSDictionary *)dict
{
    
}
@end

