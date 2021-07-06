//
//  ViewController.h
//  Fraction_Calculator
//
//  Created by Admin on 2021/7/1.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong,nonatomic) IBOutlet UILabel *display;
 -(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storeFracPart;

//数字键
 -(IBAction) clickDigit: (UIButton *) sender;
 // 算术操作键
 -(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;
 // Misc 键
 -(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;

@end
