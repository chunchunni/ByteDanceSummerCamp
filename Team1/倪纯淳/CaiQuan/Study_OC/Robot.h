//
//  Robot.h
//  Study_OC
//
//  Created by PURE on 2021/7/3.
//  Copyright © 2021 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstType.h"
@interface Robot : NSObject
{
    @public
    NSString *_name;
    int _score;
    FirstType _selectType;
}
-(void)showfirst;
-(NSString *)firstNumber:(int)number;
@end
