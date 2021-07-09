//
//  Calculator.h
//  F_Calcuator
//
//  Created by halo on 2021/7/7.
//  Copyright © 2021年 halo. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Fraction.h"
#import <Foundation/Foundation.h>

@interface Calculator : NSObject
@property (strong,nonatomic) Fraction *operand1;
@property (strong,nonatomic) Fraction *operand2;
@property (strong,nonatomic) Fraction *accumulator;

-(Fraction *) performOperation: (char) op;
-(void) clear;
@end
