//
//  Judge.h
//  proj_1
//
//  Created by halo on 2021/7/4.
//  Copyright © 2021年 halo. All rights reserved.
//
#import "Player.h"
#import "Robot.h"
#import <Foundation/Foundation.h>

@interface Judge : NSObject
{
@public
    NSString * _name;
}
-(void)caiJueWithPlay:(Player *)player andRobot:(Robot *) robot;
@end
