//
//  Caculator.h
//  Calculator
//
//  Created by Z l on 2021/7/9.
//  Copyright © 2021年 Z l. All rights reserved.
//

#import<UIKit/UIKit.h>
@interface Calculator:NSObject

@property float operand1;
@property float operand2;
@property float accumulator;

-(float) performOperation:(char) op;
-(void) clear;

@end
