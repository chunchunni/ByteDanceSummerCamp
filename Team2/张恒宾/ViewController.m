//
//  ViewController.m
//  Calculator
//
//  Created by Z l on 2021/7/8.
//  Copyright © 2021年 Z l. All rights reserved.
//

#import "ViewController.h"
#import "Caculator.h"
#import<UIKit/UIKit.h>



@implementation ViewController
{
    char op;
    float currentNumber;
    BOOL firstOperand;
    Calculator *myCalculator;
    NSMutableString *labelString;

}

@synthesize label;


- (void)viewDidLoad {
    
    firstOperand = YES;
    labelString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) processDigit:(float)digit
{
    currentNumber = currentNumber * 10 + digit;
    
    [labelString appendString:[NSString stringWithFormat:@"%g",digit]];
    label.text = labelString;
}

- (IBAction) clickDigit:(UIButton *)sender
{
    float digit = sender.tag;
    [self processDigit:digit];
}

- (void) processOp:(char)theOp
{
    NSString *opStr;
    
    op= theOp;
    
    switch (theOp){
        case '+':
            opStr=@"+";
            break;
        case '-':
            opStr=@"-";
            break;
        case '*':
            opStr=@"X";
            break;
        case '/':
            opStr=@"/";
            break;
            
    }
    
    [self storePart];
    firstOperand = NO;
    
    [labelString appendString:opStr];
    label.text = labelString;
}

-(void) storePart
{
    if(firstOperand){
        myCalculator.operand1 = currentNumber;
    }
    else{
        myCalculator.operand2 = currentNumber;
    }
    currentNumber=0;
}


-(IBAction) clickPlus
{
    [self processOp:'+'];
}
-(IBAction) clickMinus
{
    [self processOp:'-'];
}
-(IBAction) clickMultiply
{
    [self processOp:'*'];
}
-(IBAction) clickDivide
{
    [self processOp:'/'];
}
-(IBAction) clickEquals
{
    if (firstOperand == NO){
        [self storePart];
        [myCalculator performOperation: op];
        
        [labelString appendString: @ "="];
        [labelString appendString:[NSString stringWithFormat:@"%g",myCalculator.accumulator]];
        label.text = labelString;
        
        firstOperand=YES;
        currentNumber=0;
        
        [labelString setString:@""];
    }
}

-(IBAction)clickClear
{
    firstOperand=YES;
    currentNumber=0;
    [myCalculator clear];
    
    [labelString setString:@""];
    label.text= labelString;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
