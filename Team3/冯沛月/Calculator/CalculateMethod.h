#import <Foundation/Foundation.h>

@interface CalculateMethod : NSObject

@property(assign,nonatomic)long double operand1,operand2,result;

-(long double)performOperation:(int)input;
-(void)clear;

@end
