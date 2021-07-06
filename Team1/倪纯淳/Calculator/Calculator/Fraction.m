//
//  Fraction.m
//  Calculator
//
//  Created by PURE on 2021/7/6.
//  Copyright © 2021 Big Nerd Ranch. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;

- (void) setTo: (int) n over: (int) d
{
    numerator = n;
    denominator = d;
}

- (void) print
{
    NSLog(@"%i/%i", numerator, denominator);
}

- (double) convertToNum
{
    if (denominator != 0)
    {
        return (double) numerator / denominator;
    }
    else
    {
        return NAN;
    }
}

//检查分子和分母
- (NSString *) convertToString
{
    if (numerator == denominator)
    {
        if (numerator == 0)
        {
            return @"0";
        }
        else
        {
            return @"1";
        }
    }
    else if (denominator == 1)
    {
        return [NSString stringWithFormat:@"%i", numerator];
    }
    else
    {
        return [NSString stringWithFormat:@"%i/%i", numerator, denominator];
    }
}

//添加分数到消息的接收器

- (Fraction *) add: (Fraction *) f
{
    //分数相加，存储结果
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.denominator + denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    [result reduce];
    return result;
}

- (Fraction *) sub: (Fraction *) f
{
    //分数相减，存储结果
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.denominator - denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    [result reduce];
    return result;
}

- (Fraction *) mul: (Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.numerator;
    result.denominator = denominator * f.denominator;
    [result reduce];
    return result;
}

- (Fraction *) div: (Fraction *) f
{
    Fraction *result = [[Fraction alloc] init];
    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.numerator;
    [result reduce];
    return result;
}
- (void) reduce {
    int u = numerator;
    int v = denominator;
    int temp;
    if (u == 0)
    {
        return;
    }
    else if ( u < 0)
    {
        u = -u;
    }
    while (v != 0)
    {
        temp = u % v;
        u = v;
        v = temp;
    }
    numerator /= u;
    denominator /= u;
}
@end
