//
//  ViewController.m
//  Weather
//
//  Created by PURE on 2021/7/16.
//  Copyright © 2021 PURE. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "Weather.h"

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
- (BOOL)textbox:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *city = [textField.text stringByReplacingCharactersInRange:range withString:string];
     NSLog(@"----- %@",city);
     return YES;}

- (IBAction)selectInfo:(UIButton *)sender {
    [self loadData];
}


//加载网络数据
-(void)loadData
{
    //根据请求，加载网络数据
    NSURL *url=[NSURL URLWithString:@"https://www.tianqiapi.com/free/week?appid=26878371&appsecret=nRCt85eT&version=v1&city='city'"];
    //NSURLRequest *request=[NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sharedSession];
    Weather *model = [[Weather alloc]init];
    [[session dataTaskWithURL:url
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                //将二进制数据转换为字典
                NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                dispatch_async(dispatch_get_main_queue(), ^{
                    model.cityName = result[@"city"];
                    model.updateTime = [[result[@"update_time"] substringFromIndex:11] substringToIndex:5];
                    model.sevenDays = result[@"data"];
                    NSLog(@"%@ %@",model.cityName,model.updateTime);
                    self->_statusLabelCity.text = model.cityName;
                    self->_statusLabelDate.text = model.updateTime;
                    self->_statusLabelWeather.text = model.sevenDays[0][@"wea"];
                    self->_statusLabelTemp.text = [NSString stringWithFormat:@"%@˚C ~ %@˚C",model.sevenDays[0][@"tem_night"],model.sevenDays[0][@"tem_day"]];
                    self->_statusLabelDay2date.text = [model.sevenDays[1][@"date"] substringFromIndex:5];
                    self->_statusLabelDay2wea.text = model.sevenDays[1][@"wea"];
                    self->_statusLabelDay2tem.text = [NSString stringWithFormat:@"%@˚C ~ %@˚C",model.sevenDays[1][@"tem_night"],model.sevenDays[1][@"tem_day"]];
                    
                    self->_statusLabelDay3date.text = [model.sevenDays[2][@"date"] substringFromIndex:5];
                    self->_statusLabelDay3wea.text = model.sevenDays[2][@"wea"];
                    self->_statusLabelDay3tem.text = [NSString stringWithFormat:@"%@˚C ~ %@˚C",model.sevenDays[2][@"tem_night"],model.sevenDays[2][@"tem_day"]];
                    
                    self->_statusLabelDay4date.text = [model.sevenDays[3][@"date"] substringFromIndex:5];
                    self->_statusLabelDay4wea.text = model.sevenDays[3][@"wea"];
                    self->_statusLabelDay4tem.text = [NSString stringWithFormat:@"%@˚C ~ %@˚C",model.sevenDays[3][@"tem_night"],model.sevenDays[3][@"tem_day"]];
                    
                    self->_statusLabelDay5date.text = [model.sevenDays[4][@"date"] substringFromIndex:5];
                    self->_statusLabelDay5wea.text = model.sevenDays[4][@"wea"];
                    self->_statusLabelDay5tem.text = [NSString stringWithFormat:@"%@˚C ~ %@˚C",model.sevenDays[4][@"tem_night"],model.sevenDays[4][@"tem_day"]];
                    
                    self->_statusLabelDay6date.text = [model.sevenDays[5][@"date"] substringFromIndex:5];
                    self->_statusLabelDay6wea.text = model.sevenDays[5][@"wea"];
                    self->_statusLabelDay6tem.text = [NSString stringWithFormat:@"%@˚C ~ %@˚C",model.sevenDays[5][@"tem_night"],model.sevenDays[5][@"tem_day"]];
                    
                    self->_statusLabelDay7date.text = [model.sevenDays[6][@"date"] substringFromIndex:5];
                    self->_statusLabelDay7wea.text = model.sevenDays[6][@"wea"];
                    self->_statusLabelDay7tem.text = [NSString stringWithFormat:@"%@˚C ~ %@˚C",model.sevenDays[6][@"tem_night"],model.sevenDays[6][@"tem_day"]];
                    
                    
                    //self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_sunny_day.jpg"]];
                    
                    
                    
                    UIImage *image = [UIImage imageNamed:@"1.jpg"];
                    
                    self.view.layer.contents = (id) image.CGImage;// 如果需要背景透明加上下面这句
                    
                    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
                   
                    
                });
                
            }] resume];
    
}




/*
{"cityid":"101270101","city":"\u6210\u90fd","update_time":"2021-07-19 16:05:04","data":[{"date":"2021-07-19","wea":"\u9635\u96e8\u8f6c\u5c0f\u96e8","wea_img":"yu","tem_day":"33","tem_night":"23","win":"\u65e0\u6301\u7eed\u98ce\u5411","win_speed":"<3\u7ea7"},{"date":"2021-07-20","wea":"\u9635\u96e8\u8f6c\u5c0f\u96e8","wea_img":"yu","tem_day":"32","tem_night":"23","win":"\u65e0\u6301\u7eed\u98ce\u5411","win_speed":"<3\u7ea7"},{"date":"2021-07-21","wea":"\u591a\u4e91\u8f6c\u5c0f\u96e8","wea_img":"yun","tem_day":"31","tem_night":"23","win":"\u65e0\u6301\u7eed\u98ce\u5411","win_speed":"<3\u7ea7"},{"date":"2021-07-22","wea":"\u9635\u96e8\u8f6c\u5c0f\u96e8","wea_img":"yu","tem_day":"31","tem_night":"23","win":"\u65e0\u6301\u7eed\u98ce\u5411","win_speed":"<3\u7ea7"},{"date":"2021-07-23","wea":"\u9635\u96e8\u8f6c\u5c0f\u96e8","wea_img":"yu","tem_day":"27","tem_night":"23","win":"\u65e0\u6301\u7eed\u98ce\u5411","win_speed":"<3\u7ea7"},{"date":"2021-07-24","wea":"\u9635\u96e8\u8f6c\u5c0f\u96e8","wea_img":"yu","tem_day":"30","tem_night":"23","win":"\u65e0\u6301\u7eed\u98ce\u5411","win_speed":"<3\u7ea7"},{"date":"2021-07-25","wea":"\u5c0f\u96e8\u8f6c\u6674","wea_img":"yu","tem_day":"33","tem_night":"24","win":"\u65e0\u6301\u7eed\u98ce\u5411","win_speed":"<3\u7ea7"}]}
*/

@end

