//
//  myWeather.h
//  Weather
//
//  Created by halo on 2021/7/19.
//  Copyright © 2021年 PURE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myWeather : NSObject
@property(nonatomic,strong)     NSString *city;
@property(nonatomic,strong) NSString *updatetime;
@property(nonatomic,strong) NSString *wea;
@property(nonatomic,strong) NSString *wea_next;
@property(nonatomic,strong) NSString *wea_afternext;
@property(nonatomic,strong) NSString *temp_next;
@property(nonatomic,strong) NSString *temp_afternext;
@property(nonatomic,strong) NSArray *temp_7;



@end
