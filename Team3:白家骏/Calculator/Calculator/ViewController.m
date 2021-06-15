//
//  ViewController.m
//  Calculator
//
//  Created by Bill Haku on 2021/06/12.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *onShow;

@end

int i = 10;

@implementation ViewController
- (IBAction)Click:(UIButton *)sender {
    float value = [sender.currentTitle floatValue];
    NSLog(@"Clicked, value = %f",value);
    if(cal.type == '+' || cal.type == '-' || cal.type == '*' || cal.type == '/') {
        if(cal.dot == '.') {
            NSLog(@"cal.dot == .");
            cal.b = cal.b + value / i;
            i = i * 10;
        }
        else {
            NSLog(@"cal.dot != .");
            cal.b = cal.b * 10 + value;
        }
        NSLog(@"type is determined.");
        NSLog(@"cal.b = %f",cal.b);
        self.onShow.text = [NSString stringWithFormat:@"%f",cal.b];
    }
    else {
        if(cal.dot == '.') {
            NSLog(@"cal.dot == .");
            cal.a = cal.a + value / i;
            i = i * 10;
        }
        else {
            NSLog(@"cal.dot != .");
            NSLog(@"value = %f", value);
            cal.a = cal.a * 10 + value;
            NSLog(@"cal.a = %f", cal.a);
        }
        NSLog(@"type is not determined.");
        NSLog(@"cal.a = %f",cal.a);
        self.onShow.text = [NSString stringWithFormat:@"%f",cal.a];
    }
}

- (IBAction)clickDot:(id)sender {
    NSLog(@"clicked dot");
    cal.dot = '.';
}

- (IBAction)calType:(UIButton *)sender {
    cal.dot = '0';
    i = 10;
    
    if(sender.tag == 1) {
        NSLog(@"clicked +");
        cal.type = '+';
    }
    if(sender.tag == 2) {
        cal.type = '-';
    }
    if(sender.tag == 3) {
        cal.type = '*';
    }
    if(sender.tag == 4) {
        cal.type = '/';
    }
}

- (IBAction)work:(id)sender {
    NSLog(@"clicked work");
    float gg = [cal work];
    NSLog(@"%f",gg);
    self.onShow.text = [NSString stringWithFormat:@"%f",gg];
    cal.a = 0;
    cal.b = 0;
    cal.type = 0;
    cal.dot = 0;
    i = 10;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
