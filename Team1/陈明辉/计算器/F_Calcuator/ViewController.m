//
//  ViewController.m
//  F_Calcuator
//
//  Created by halo on 2021/7/7.
//  Copyright © 2021年 halo. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
@interface ViewController ()

@end

@implementation ViewController
{
    char  op;
    int currentNumber;
    BOOL firstOperand, isNumberator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}
@synthesize display;

- (void)viewDidLoad {
    // Do any additional setup after loading the view, typically from a nib.
    firstOperand = YES;
    isNumberator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];
}
-(void)processDigit:(int)digit
{
    currentNumber = currentNumber * 10 + digit;
    [displayString appendString:[NSString stringWithFormat:@"%i",digit]];
    display.text = displayString;
}

-(IBAction)clickDigit:(UIButton *)sender
{
    int digit = sender.tag;
    [self processDigit:digit];
}

-(void)processOp:(char)theOp
{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
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
    isNumberator = YES;
    
    [displayString appendString:opStr];
    display.text = displayString;
}
-(void) storeFracPart
{
    if(firstOperand){
        if(isNumberator){
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if(isNumberator)
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
-(IBAction)clickOver{
    [self storeFracPart];
    isNumberator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
}

-(IBAction)clickPlus
{
    [self processOp:'+'];
}

-(IBAction)clickMinus
{
    [self processOp:'-'];
}

-(IBAction)clickMultiply
{
    [self processOp:'*'];
}

-(IBAction)clickDivide
{
    [self processOp:'/'];
}

-(IBAction)clickEquals
{
    if ( firstOperand == NO){
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        display.text= displayString;
        
        currentNumber = 0;
        isNumberator =YES;
        firstOperand = YES;
        [displayString setString:@""];
    }
}

-(IBAction)clickClear
{
    isNumberator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text = displayString;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
