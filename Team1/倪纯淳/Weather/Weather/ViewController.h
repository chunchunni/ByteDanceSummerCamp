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
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay1;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay2;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay3;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay4;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay5;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay6;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelDay7;


- (IBAction) buttonPressed:(UIButton *)sender;
- (void)loadData;
- (void)showWeather:(Weather *) model;

@end

