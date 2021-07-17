//
//  ViewController.m
//  Weather
//
//  Created by PURE on 2021/7/16.
//  Copyright © 2021 PURE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *httpUrl = @"https://api.heweather.com/x3/weather?cityid=CN101210906&key=1cce17d4649344949ef7a619efec1cd5";
    //[self request: httpUrl];
    [self loadData];
}

-(void)request: (NSString*)httpUrl {
    NSError *error;
    //加载一个NSURL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:httpUrl]];
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
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
    NSLog(@"1");
    //根据请求，加载网络数据
    NSURL *url=[NSURL URLWithString:@"https://www.weather.com.cn/adat/sk/101010100.html"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url
                                           cachePolicy:0 timeoutInterval:10.0];
    NSLog(@"2");
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                //将二进制数据转换为字典
                NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                NSLog(@"%@ 市温度 %@ 风向 %@ 风力 %@",
                      result[@"weatherinfo"][@"city"],
                      result[@"weatherinfo"][@"temp"],
                      result[@"weatherinfo"][@"WD"],
                      result[@"weatherinfo"][@"WS"]);
                NSLog(@"3");
            }] resume];
}

@end
