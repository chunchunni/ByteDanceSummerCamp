//
//  Player.m
//  Study_OC
//
//  Created by PURE on 2021/7/3.
//  Copyright © 2021 Big Nerd Ranch. All rights reserved.
//

#import "Player.h"

@implementation Player
-(void)showFirst
{
    NSLog(@"[%@] choose 1-jiandao, 2-shitou, 3-bu", _name);
    int userselect = 0;
    scanf("%d",&userselect);
    
    NSLog(@"[%@] show: %@", _name, [self firstNumber:userselect]);
    
    _selectedType = userselect;
    
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
