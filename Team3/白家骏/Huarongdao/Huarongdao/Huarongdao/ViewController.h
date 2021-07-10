//
//  ViewController.h
//  Huarongdao
//
//  Created by Bill Haku on 2021/07/08.
//

#import <UIKit/UIKit.h>
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define BLOCKSIZEUNIT SCREENWIDTH / 6

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *Block0;
@property (strong, nonatomic) IBOutlet UILabel *Block1;
@property (strong, nonatomic) IBOutlet UILabel *Block2;
@property (strong, nonatomic) IBOutlet UILabel *Block3;
@property (strong, nonatomic) IBOutlet UILabel *Block4;
@property (strong, nonatomic) IBOutlet UILabel *Block5;
@property (strong, nonatomic) IBOutlet UILabel *Block6;
@property (strong, nonatomic) IBOutlet UILabel *Block7;
@property (strong, nonatomic) IBOutlet UILabel *Block8;
@property (strong, nonatomic) IBOutlet UILabel *Block9;
@property (strong, nonatomic) IBOutlet UILabel *Block10;
@property (strong, nonatomic) IBOutlet UILabel *Ob0;
@property (strong, nonatomic) IBOutlet UIButton *StartButton;

-(IBAction)StartProcess:(UIButton *)sender;

@end

