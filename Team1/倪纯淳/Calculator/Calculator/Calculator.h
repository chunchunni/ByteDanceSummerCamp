//
//  Calculator.h
//  Calculator
//
//  Created by PURE on 2021/7/6.
//  Copyright © 2021 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fraction.h"

@interface Calculator : NSObject

@property (strong, nonatomic) Fraction *operand1;
@property (strong, nonatomic) Fraction *operand2;
@property (strong, nonatomic) Fraction *accumulator;

- (Fraction *)performOperation:(char) op;
- (void)clear;

@end
