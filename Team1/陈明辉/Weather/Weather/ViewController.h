//
//  ViewController.h
//  Weather
//
//  Created by PURE on 2021/7/16.
//  Copyright © 2021 PURE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myWeather.h"
#import "AFNetworking.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController

@property (weak,nonatomic) IBOutlet UILabel *l1;
@property (weak,nonatomic) IBOutlet UILabel *Temp;
@property (weak,nonatomic) IBOutlet UILabel *Wea;
@property (weak,nonatomic) IBOutlet UILabel *next1_wea;
@property (weak,nonatomic) IBOutlet UILabel *next1_temp;
@property (weak,nonatomic) IBOutlet UILabel *next2_wea;
@property (weak,nonatomic) IBOutlet UILabel *next2_temp;
@property (weak,nonatomic) IBOutlet UILabel *date;
//定位

@property myWeather *weather;

    //定位
@property(strong,nonatomic) CLLocationManager *_locationManager;//用于获取位置
@property(strong,nonatomic) CLLocation *_checkLocation;//用于保存位置信息
    
@property    double latitude;//经度
@property    double longitude;//维度
    

- (void) processdata:(NSDictionary *)dict;
- (void)loadData;
- (void) bt:(UIButton *)sender;
- (void)setupLocationManager;
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray*)locations;
- (void) showLocation;

@end

