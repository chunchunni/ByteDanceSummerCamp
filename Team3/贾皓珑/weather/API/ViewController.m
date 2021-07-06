//
//  ViewController.m
//  weather
//
//  Created by Admin on 2021/7/6.
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
//加载网络数据
-(void)loadData
{
    //根据请求，加载网络数据
    NSURL *url=[NSURL URLWithString:@"http://www.weather.com.cn/adat/sk/101010100.html"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url
                                           cachePolicy:0 timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                //将二进制数据转换为字典
                NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:NSJSONReadingAllowFragments
                                                                         error:&error];
                NSLog(@"%@ 市温度 %@ 风向 %@ 风力 %@",
                      result[@"weatherinfo"][@"city"],
                      result[@"weatherinfo"][@"temp"],
                      result[@"weatherinfo"][@"WD"],
                      result[@"weatherinfo"][@"WS"]);
            }] resume];
}
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
