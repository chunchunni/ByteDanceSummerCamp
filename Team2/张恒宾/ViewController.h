//
//  ViewController.h
//  Calculator
//
//  Created by Z l on 2021/7/8.
//  Copyright © 2021年 Z l. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong,nonatomic) IBOutlet UILabel *label;

-(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storePart;


-(IBAction) clickDigit: (UIButton *) sender;

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

-(IBAction) clickEquals;
-(IBAction) clickClear;


@end

