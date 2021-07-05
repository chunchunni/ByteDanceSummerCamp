//
//  main.m
//  Fraction
//
//  Created by Z l on 2021/7/5.
//  Copyright © 2021年 Z l. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import"Fraction.h"

int main (int argc, const char * argv[]) {
    @autoreleasepool {
        Fraction *myFraction = [[Fraction alloc] init];
        
        //设置分数为1/3
        
        [myFraction setNumerator:1];
        [myFraction setDenominator:3];
        
        //显示分数
        
        NSLog(@"The value of myFraction is:");
        [myFraction print];
    }
    return 0;
}

