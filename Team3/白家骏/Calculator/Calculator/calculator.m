//
//  calculator.m
//  Calculator
//
//  Created by Bill Haku on 2021/06/12.
//

#import <Foundation/Foundation.h>
#import "calculator.h"

@implementation calculator
-(float)work {
    if(self.type == '+') {
        return self.a + self.b;
    }
    if(self.type == '-') {
        return self.a - self.b;
    }
    if(self.type == '*') {
        return self.a * self.b;
    }
    if(self.type == '/') {
        return self.a / self.b;
    }
    else return 0;
}

@end
