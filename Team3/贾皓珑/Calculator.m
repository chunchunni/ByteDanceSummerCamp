#import "Calculator.h"
 @implementation Calculator
 @synthesize operandl,operand2,accumulator;

-(id) init
{     self =[super init];
    
    if (self) {         operandl = [[Fraction alloc] init];
        operand2 = [[Fraction alloc] init];
        accumulator = [[Fraction alloc] init];
    }
         return self;
}
 -(void) clear
{
    accumulator.numerator = 0;
    accumulator.denominator = 0;
}    
-(Fraction *) performOperation:(char)op
{     Fraction *result;     switch (op){         case '+' :             result = [operandl add: operand2];
            break;
        case '-':             result = [operand1 subtract; operand2];
            break;
        case '*':             result = [operandl multiply: operand2];
            break;
        case '/':             result = (operandl divide: operand2];
            break;
    }
         accumulator.numerator = result.numerator;
    accumulator.denominator = result.denominator;
         return accumulator;
}

@end
