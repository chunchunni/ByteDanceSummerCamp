//
//  Fraction.m
//  Fraction
//
//  Created by Z l on 2021/7/5.
//  Copyright © 2021年 Z l. All rights reserved.
//
#import "Fraction.h"
//#import <Foundation/Foundation.h>


@implementation Fraction
{
    int numerator;
    int denominator;
}

-(void) print
{
    NSLog(@"%i/%i",numerator,denominator);
}

-(void) setNumerator:(int)n
{
    numerator = n;
}

-(void) setDenominator:(int) d
{
    denominator = d;
}

-(int) numerator
{
    return numerator;
}

-(int) denominator
{
    return denominator;
}

-(double) converToNum
{
    if (denominator != 0)
        return (double) numerator / denominator;
    else
        return NAN;
}
@end
