//
//  Judge.h
//  Study_OC
//
//  Created by PURE on 2021/7/3.
//  Copyright © 2021 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Robot.h"
#import "Judge.h"
@interface Judge : NSObject
{
    @public
    NSString  * _name;
}

-(void)caiJueWithPlay:(Player *)player andRobot:(Robot *)robot;
@end
