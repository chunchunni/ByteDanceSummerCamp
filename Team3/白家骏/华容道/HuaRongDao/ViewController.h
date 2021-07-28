//
//  ViewController.h
//  Fraction_calculator_whz
//
//  Created by Admin on 2021/7/6.
//

#import <UIKit/UIKit.h>
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define SIZEUNIT 93.5

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *allview;
@property (strong, nonatomic) IBOutlet UIView *cc;
@property (strong, nonatomic) IBOutlet UIView *zf;
@property (strong, nonatomic) IBOutlet UIView *mc;
@property (strong, nonatomic) IBOutlet UIView *hz;
@property (strong, nonatomic) IBOutlet UIView *gy;
@property (strong, nonatomic) IBOutlet UIView *zy;
@property (strong, nonatomic) IBOutlet UIView *xb1;
@property (strong, nonatomic) IBOutlet UIView *xb2;
@property (strong, nonatomic) IBOutlet UIView *xb3;
@property (strong, nonatomic) IBOutlet UIView *xb4;
@property (strong, nonatomic) IBOutlet UIButton *finishbutton;
@property (strong, nonatomic) IBOutlet UILabel *Title;
@property (strong, nonatomic) IBOutlet UIImageView *backGroundImage;

-(IBAction) clickfinish;


@end
