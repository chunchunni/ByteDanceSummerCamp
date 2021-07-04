//
//  Robot.m
//  Study_OC
//
//  Created by PURE on 2021/7/3.
//  Copyright © 2021 Big Nerd Ranch. All rights reserved.
//

#import "Robot.h"
#import "Player.h"
@implementation Robot
-(void)showfirst
{
    int robotselect = arc4random_uniform(3)+1;
    NSLog(@"Robot[%@] choose %@",_name, [self firstNumber:robotselect]);
    _selectType = robotselect;
}

-(NSString *)firstNumber:(int)number
{
    switch (number) {
        case 1:
            return @"剪刀";
        case 2:
            return @"石头";
        default:
            return @"布";
    }
    return @"";
}
@end
