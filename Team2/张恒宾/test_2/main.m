//
//  main.m
//  test_3
//
//  Created by Z l on 2021/6/30.
//  Copyright © 2021年 Z l. All rights reserved.
//

#import <Foundation/Foundation.h>

//-----@interface部分-----类和类的方法

@interface Fraction: NSObject

-(void) print;
-(void) setNumerator: (int) n;
-(void) setDenominator: (int) d;

@end

//-----@implementation部分-----数据（类对象的实例变量存储的数据）

@implementation Fraction
{
    int numerator;
    int denominator;
}
-(void) print
{
    NSLog(@"%i/%i",numerator,denominator);
}

-(void) setNumerator: (int) n
{
    numerator=n;
}

-(void) setDenominator:(int) d
{
    denominator = d;
}

@end

//-----program部分-----

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*Fraction *myFraction;  //定义一个名为myFraction的变量
        
        //创建一个分数实例
        
        myFraction = [Fraction alloc];//分配空间
        myFraction = [myFraction init];//初始化对象
        //myFraction = [[Fraction alloc] init];
        //Fraction *myFraction=[[Fraction alloc] init];
         //Fraction *myFraction=[Fraction new];
        
        //设置分数为1/3
        
        [myFraction setNumerator: 1];
        [myFraction setDenominator: 3];
        
        //使用打印方法显示分数
        
        NSLog (@"The value of myFraction is:");
        [myFraction print];*/
        Fraction *frac1=[[Fraction alloc] init];
        Fraction *frac2=[[Fraction alloc] init];
        [frac1 setNumerator:2];
        [frac1 setDenominator:3];
        [frac2 setNumerator:3];
        [frac2 setDenominator:7];
        NSLog(@"First fraction is:");
        [frac1 print];
        NSLog(@"Second fraction is:");
        [frac2 print];
        
        
        
        
    }
    return 0;
}
