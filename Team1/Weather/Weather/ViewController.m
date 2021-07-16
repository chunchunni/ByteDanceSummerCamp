//
//  ViewController.m
//  Weather
//
//  Created by Admin on 2021/7/15.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)getAFNetworking {
    NSURL *url=[NSURL URLWithString:@"https://www.tianqiapi.com/free/day?appid=52253853&appsecret=EIq5erZY"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url
                                           cachePolicy:0 timeoutInterval:10.0];
    NSLog(@"%s",request.HTTPBody);
}
@end
