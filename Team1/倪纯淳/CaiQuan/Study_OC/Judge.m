//
//  Judge.m
//  Study_OC
//
//  Created by PURE on 2021/7/3.
//  Copyright © 2021 Big Nerd Ranch. All rights reserved.
//

#import "Judge.h"

@implementation Judge
-(void)caiJueWithPlay:(Player *)player andRobot:(Robot *)robot
{
    FirstType playerType = player-> _selectedType;
    FirstType robotType = robot-> _selectType;
    
    if(playerType - robotType == -2 || playerType - robotType == 1)
    {
        NSLog(@"Player [%@] win!", player -> _name);
        player->_score += 1;
    }
    else if(playerType - robotType == 0)
    {
        NSLog(@"Player [%@] equal with Robot [%@]!", player -> _name, robot -> _name);
    }
    else
    {
        NSLog(@"Robot [%@] win!", robot -> _name);
        robot->_score += 1;
    }
    
    NSLog(@"Player[%@]:[%d]-----Robot[%@]:[%d]",player ->_name,player ->_score,robot ->_name,robot ->_score);
}
@end
