//
//  ViewController.m
//  Huarongdao
//
//  Created by Bill Haku on 2021/07/08.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize Block0;
@synthesize Block1;
@synthesize Block2;
@synthesize Block3;
@synthesize Block4;
@synthesize Block5;
@synthesize Block6;
@synthesize Block7;
@synthesize Block8;
@synthesize Block9;
@synthesize Block10;
@synthesize StartButton;

- (IBAction)StartProcess:(UIButton *)sender {
    Block10.text = @"处理中";
    CGPoint movingCenter = self.Block0.center;
    Block0.center = movingCenter;
    
    [UIView animateWithDuration: 1 animations:^{
        Block0.center = movingCenter;
    }completion: nil];
    movingCenter.x += SCREENWIDTH / 6;
    [UIView animateWithDuration: 1 animations:^{
        Block0.center = movingCenter;
    }completion: nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Init all the positions of the blocks.
    Block0.frame = CGRectMake(BLOCKSIZEUNIT * 2, BLOCKSIZEUNIT * 2, BLOCKSIZEUNIT * 2, BLOCKSIZEUNIT * 2);
    Block1.frame = CGRectMake(BLOCKSIZEUNIT * 2, BLOCKSIZEUNIT * 5, BLOCKSIZEUNIT * 2, BLOCKSIZEUNIT);
    Block2.frame = CGRectMake(BLOCKSIZEUNIT, BLOCKSIZEUNIT * 2, BLOCKSIZEUNIT, BLOCKSIZEUNIT * 2);
    Block3.frame = CGRectMake(BLOCKSIZEUNIT * 4, BLOCKSIZEUNIT * 2, BLOCKSIZEUNIT, BLOCKSIZEUNIT * 2);
    Block4.frame = CGRectMake(BLOCKSIZEUNIT, BLOCKSIZEUNIT * 4, BLOCKSIZEUNIT, BLOCKSIZEUNIT * 2);
    Block5.frame = CGRectMake(BLOCKSIZEUNIT * 4, BLOCKSIZEUNIT * 4, BLOCKSIZEUNIT, BLOCKSIZEUNIT * 2);
    Block6.frame = CGRectMake(BLOCKSIZEUNIT, BLOCKSIZEUNIT * 6, BLOCKSIZEUNIT, BLOCKSIZEUNIT);
    Block7.frame = CGRectMake(BLOCKSIZEUNIT * 2, BLOCKSIZEUNIT * 6, BLOCKSIZEUNIT, BLOCKSIZEUNIT);
    Block8.frame = CGRectMake(BLOCKSIZEUNIT * 3, BLOCKSIZEUNIT * 6, BLOCKSIZEUNIT, BLOCKSIZEUNIT);
    Block9.frame = CGRectMake(BLOCKSIZEUNIT * 4, BLOCKSIZEUNIT * 6, BLOCKSIZEUNIT, BLOCKSIZEUNIT);
    StartButton.center = CGPointMake(SCREENWIDTH / 2, SCREENHEIGHT / 16 * 13);
    Block10.center = CGPointMake(SCREENWIDTH / 2, SCREENHEIGHT / 16 * 15);
}


@end
