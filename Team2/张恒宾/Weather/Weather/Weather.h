//
//  Weather.h
//  Weather
//
//  Created by PURE on 2021/7/19.
//  Copyright © 2021 PURE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property(nonatomic,strong)NSString *cityName;
@property(nonatomic,strong)NSString *updateTime;
@property(nonatomic,strong)NSArray *sevenDays;


@end
