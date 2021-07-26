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
@interface ViewController : UIViewController

@property (weak,nonatomic) IBOutlet UILabel *l1;
@property (weak,nonatomic) IBOutlet UILabel *Temp;
@property (weak,nonatomic) IBOutlet UILabel *Wea;
@property (weak,nonatomic) IBOutlet UILabel *next1_wea;
@property (weak,nonatomic) IBOutlet UILabel *next1_temp;
@property (weak,nonatomic) IBOutlet UILabel *next2_wea;
@property (weak,nonatomic) IBOutlet UILabel *next2_temp;
@property (weak,nonatomic) IBOutlet UILabel *date;

@property myWeather *weather;
- (void) processdata:(NSDictionary *)dict;
- (void)loadData;
- (void) bt:(UIButton *)sender;
@end

