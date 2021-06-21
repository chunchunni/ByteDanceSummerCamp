//
//  Fraction.m
//  Fraction_Calculator
//
//  Created by zsc on 2021/6/21.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@implementation Fraction


@synthesize numerator,denominator;

-(void) setTo:(int)n over:(int)d
{
    numerator = n;
    denominator  =d;
}

-(void) print
{
    NSLog(@"%i/%i",numerator,denominator);
}

-(double) convertToNum
{
    if( denominator !=0)
        return (double) numerator/denominator;
    else
        return NAN;
}

-(NSString *) convertToString
{
//    NSLog(@"%i/%i",numerator,denominator);
    if(numerator ==denominator)
        if(numerator==0)
            return @"0";
        else
            return @"1";
    else if(denominator==1)
        return [NSString stringWithFormat:@"%i",numerator];
    else
        return [NSString stringWithFormat:@"%i/%i",numerator,denominator];
}

-(Fraction *) add:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.denominator+denominator*f.numerator;
    
    result.denominator = denominator*f.denominator;
    
    [result reduce];
    return result;
}

-(Fraction *)subtract:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator =numerator * f.denominator-denominator*f.numerator;
    
    result.denominator = denominator*f.denominator;
    
    [result reduce];
    return result;
}

-(Fraction *)multiply:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator =numerator *f.numerator;

    
    result.denominator = denominator*f.denominator;
    
    [result reduce];
    return result;
}

-(Fraction *)divide:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator =numerator *f.denominator;
    
    result.denominator = denominator*f.numerator;
    
    [result reduce];
    return result;
}

-(void) reduce
{
    NSLog(@"%i/%i",numerator,denominator);
    int u = numerator;
    int v = denominator;
    int tmp;
    
    if(u ==0)
        return;
    else if(u<0)
        u = -u;
    
    while(v !=0){
        tmp = u%v;
        u=v;
        v = tmp;
    }
    
    numerator /= u;
    denominator /= u;
}

@end
