//
//  calculator.h
//  Calculator
//
//  Created by Bill Haku on 2021/06/12.
//

#ifndef calculator_h
#define calculator_h

#import <Foundation/Foundation.h>
#import "calculator.h"

@interface calculator : NSObject

@property float a;
@property float b;
@property char type;
@property char dot;
- (float)work;

@end

#endif /* calculator_h */
