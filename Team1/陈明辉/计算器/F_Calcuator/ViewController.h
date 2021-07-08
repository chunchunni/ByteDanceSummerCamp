//
//  ViewController.h
//  F_Calcuator
//
//  Created by halo on 2021/7/7.
//  Copyright © 2021年 halo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong,nonatomic) IBOutlet UILabel *display;
-(void) processDigit:(int) digit;
-(void) processOp:(char) theOp;
-(void) storeFracPart;
//数字键
-(IBAction)clickDigit:(UIButton *) sender;
//算术操作键
-(IBAction)clickPlus;
-(IBAction)clickMinus;
-(IBAction)clickMultiply;
-(IBAction)clickDivide;

//Misc键
-(IBAction)clickOver;
-(IBAction)clickEquals;
-(IBAction)clickClear;

@end

