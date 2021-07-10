//
//  Calculator.m
//  Calculator
//
//  Created by Z l on 2021/7/9.
//  Copyright © 2021年 Z l. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"Caculator.h"

@implementation Calculator
@synthesize operand1,operand2,accumulator;

-(id) init
{
    self = [super init];
    
    if(self){
        operand1 = 0;
        operand2 = 0;
        accumulator = 0;
    }
    
    return self;
}

-(void) clear
{
    accumulator = 0;
}



-(float) performOperation:(char)op
{
    float result = 0.0;
    
    switch(op){
        case'+':
            result = operand1 + operand2;
            break;
        case'-':
            result = operand1 - operand2;
            break;
        case'*':
            result = operand1 * operand2;
            break;
        case'/':
            result = operand1 / operand2;
            break;
            
    }
    accumulator = result;
    return accumulator;
    
}


@end


