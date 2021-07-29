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
    [self showLocation];
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
                self.weather.temp_next = self.weather.temp_7[1][@"tem_day"];
                self.weather.temp_afternext = self.weather.temp_7[2][@"tem_day"];
                
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
                    //NSLog(@"%@",self.weather.temp_7[2][@"tem_day"]);
                });
            }] resume];
    UIImage *image = [UIImage imageNamed:@"bg.jpg"];
    
    self.view.layer.contents = (id) image.CGImage;
    
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
}
- (void)processdata:(NSDictionary *)dict:(NSDictionary *)dict
{
    
}

/*- (void) setupLocationManager{
    _latitude = LATITUDE_DEFAULT;//设置默认的值
    _longitude =LONGITUDE_DEFAULT;
    _locationManager = [[CLLocationManageralloc]init];
    
    if ([CLLocationManagerlocationServicesEnabled]) {
        NSLog(@"开始定位");
        _locationManager.delegate = self;
        // distanceFilter是距离过滤器，为了减少对定位装置的轮询次数，位置的改变不会每次都去通知委托，而是在移动了足够的距离时才通知委托程序
        //它的单位是米，这里设置为至少移动1000再通知委托处理更新;
        _locationManager.distanceFilter = 200.0;
        // kCLLocationAccuracyBest:设备使用电池供电时候最高的精度
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        
        //ios8+以上要授权，并且在plist文件中添加NSLocationWhenInUseUsageDescription，NSLocationAlwaysUsageDescription，值可以为空
        if (IOS_VERSION >=8.0) {//ios8+，不加这个则不会弹框
            [_locationManagerrequestWhenInUseAuthorization];//使用中授权
            [_locationManagerrequestAlwaysAuthorization];
        }
        [_locationManagerstartUpdatingLocation];
    }else{
        NSLog(@"定位失败，请确定是否开启定位功能");
    }
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray*)locations{
    NSLog(@"didUpdateToLocation+++");
    //此处locations存储了持续更新的位置坐标值，取最后一个值为最新位置，如果不想让其持续更新位置，则在此方法中获取到一个值之后让locationManager stopUpdatingLocation
    CLLocation *cl = [locationslastObject];
    _latitude = cl.coordinate.latitude;
    _longitude = cl.coordinate.longitude;
    NSLog(@"纬度--%f",_latitude);
    NSLog(@"经度--%f",_longitude	);
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"定位失败");
}
 */
- (void) showLocation{
    //CLLocation *current_location =;
    
    float latitude = 30.911030000;
    float longitude = 103.4135540000;
    // 创建经纬度
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    //创建一个译码器
    CLGeocoder *cLGeocoder = [[CLGeocoder alloc] init];
    [cLGeocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *place = [placemarks objectAtIndex:0];
        // 位置名
        NSLog(@"name,%@",place.name);
        // 街道
        NSLog(@"thoroughfare,%@",place.thoroughfare);
        // 子街道
        NSLog(@"subThoroughfare,%@",place.subThoroughfare);
        // 市
        NSLog(@"locality,%@",place.locality);
        // 区
        NSLog(@"subLocality,%@",place.subLocality);
        // 国家
        NSLog(@"country,%@",place.country);
    }];
    
    
}
 
@end

