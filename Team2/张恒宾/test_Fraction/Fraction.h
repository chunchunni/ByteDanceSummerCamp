//
//  Fraction.h
//  Fraction
//
//  Created by Z l on 2021/7/5.
//  Copyright © 2021年 Z l. All rights reserved.
//

//#ifndef Fraction_h
//#define Fraction_h

#import<Foundation/Foundation.h>

//Fraction类

@interface Fraction : NSObject

-(void) print;
-(void) setNumerator: (int) n;
-(void) setDenominator: (int) d;
-(int) numerator;
-(int) denominator;
-(double) converToNum;
@end


//#endif /* Fraction_h */
