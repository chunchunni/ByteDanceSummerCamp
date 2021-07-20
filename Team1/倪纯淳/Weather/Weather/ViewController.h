//
//  ViewController.h
//  Weather
//
//  Created by PURE on 2021/7/16.
//  Copyright © 2021 PURE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "Weather.h"
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *statusLabelCity;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDate;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelWeather;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelAIR;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelTemp;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay2date;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay2wea;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay2tem;

@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay3date;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay3wea;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay3tem;

@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay4date;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay4wea;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay4tem;

@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay5date;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay5wea;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay5tem;

@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay6date;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay6wea;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay6tem;

@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay7date;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay7wea;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay7tem;

- (IBAction) buttonPressed:(UIButton *)sender;
- (void)loadData;

@end

