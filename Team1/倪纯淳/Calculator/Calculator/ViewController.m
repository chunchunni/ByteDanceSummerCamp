//
//  ViewController.m
//  Calculator
//
//  Created by PURE on 2021/7/6.
//  Copyright © 2021 Big Nerd Ranch. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@implementation ViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad
{
    // 覆盖应用程序载入的自定义方法
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];
}

//显示数字
- (void)processDigit:(int) digit
{
    currentNumber = currentNumber * 10 + digit;
    [displayString appendString:[NSString stringWithFormat:@"%i", digit]];
    display.text = displayString;
}


- (IBAction)clickButton0
{
    [self processDigit: 0];
}
- (IBAction)clickButton1
{
    [self processDigit: 1];
}
- (IBAction)clickButton2
{
    [self processDigit: 2];
}
- (IBAction)clickButton3
{
    [self processDigit: 3];
}
- (IBAction)clickButton4
{
    [self processDigit: 4];
}
- (IBAction)clickButton5
{
    [self processDigit: 5];
}
- (IBAction)clickButton6
{
    [self processDigit: 6];
}
- (IBAction)clickButton7
{
    [self processDigit: 7];
}
- (IBAction)clickButton8
{
    [self processDigit: 8];
}
- (IBAction)clickButton9
{
    [self processDigit: 9];
}

- (void)processOp:(char) theOp
{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp)
    {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString:opStr];
    display.text = displayString;
}

- (void)storeFracPart
{
    if(firstOperand)
    {
        if(isNumerator)
        {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
        {
            myCalculator.operand1.denominator = currentNumber;
        }
    }
    else if(isNumerator)
    {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    else
    {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    currentNumber = 0;
}


- (IBAction)clickOver
{
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
}

//算术操作键
- (IBAction)clickPlus
{
    [self processOp:'+'];
}
- (IBAction)clickMinus
{
    [self processOp:'-'];
}
- (IBAction)clickMultiply
{
    [self processOp:'*'];
}
- (IBAction)clickDivide
{
    [self processOp:'/'];
}

//MISC键
- (IBAction)clickEquals
{
    if(firstOperand == NO)
    {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString: @" = "];
        [displayString appendString: [myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
    }
}

- (IBAction)clickClear
{
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text = displayString;
}

@end
