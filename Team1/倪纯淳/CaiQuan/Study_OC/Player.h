//
//  Player.h
//  Study_OC
//
//  Created by PURE on 2021/7/3.
//  Copyright © 2021 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstType.h"
@interface Player : NSObject
{
    @public
    NSString *_name;
    int _score;
    FirstType _selectedType;
    
}

-(void)showFirst;
// 根据传入的数字选择出拳方式
-(NSString *)firstNumber: (int)number;
@end
