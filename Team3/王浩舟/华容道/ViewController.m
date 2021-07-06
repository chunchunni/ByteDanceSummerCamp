//
//  ViewController.m
//  Fraction_calculator_whz
//
//  Created by Admin on 2021/7/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize cc,hz,zf,mc,gy,zy,xb1,xb2,xb3,xb4;

int mp[5][4] = {1,2,2,3,1,2,2,3,4,0,0,6,4,5,5,6,7,8,9,10};
// 1zf 2cc 3mc 4hz 5gy 6zy 7xb1 8xb2 9xb3 10xb4
int loc[11][4] = {
    0,0,0,0,
    0,0,1,2,
    0,1,2,2,
    0,3,1,2,
    2,0,1,2,
    3,1,2,1,
    2,3,1,2,
    4,0,1,1,
    4,1,1,1,
    4,2,1,1,
    4,3,1,1
};

- (void)showMessage:(NSString *)Msg {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:Msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    
    [cc addGestureRecognizer:swipeLeft];
    [cc addGestureRecognizer:swipeRight];
    [cc addGestureRecognizer:swipeUp];
    [cc addGestureRecognizer:swipeDown];
    
    
    swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [zf addGestureRecognizer:swipeLeft];
    [zf addGestureRecognizer:swipeRight];
    [zf addGestureRecognizer:swipeUp];
    [zf addGestureRecognizer:swipeDown];
    
    
    swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [mc addGestureRecognizer:swipeLeft];
    [mc addGestureRecognizer:swipeRight];
    [mc addGestureRecognizer:swipeUp];
    [mc addGestureRecognizer:swipeDown];
    
    
    swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [hz addGestureRecognizer:swipeLeft];
    [hz addGestureRecognizer:swipeRight];
    [hz addGestureRecognizer:swipeUp];
    [hz addGestureRecognizer:swipeDown];
    
    
    swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [gy addGestureRecognizer:swipeLeft];
    [gy addGestureRecognizer:swipeRight];
    [gy addGestureRecognizer:swipeUp];
    [gy addGestureRecognizer:swipeDown];
    
    
    swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [zy addGestureRecognizer:swipeLeft];
    [zy addGestureRecognizer:swipeRight];
    [zy addGestureRecognizer:swipeUp];
    [zy addGestureRecognizer:swipeDown];
    
    
    swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [xb1 addGestureRecognizer:swipeLeft];
    [xb1 addGestureRecognizer:swipeRight];
    [xb1 addGestureRecognizer:swipeUp];
    [xb1 addGestureRecognizer:swipeDown];
    
    
    swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [xb2 addGestureRecognizer:swipeLeft];
    [xb2 addGestureRecognizer:swipeRight];
    [xb2 addGestureRecognizer:swipeUp];
    [xb2 addGestureRecognizer:swipeDown];
    
    
    swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [xb3 addGestureRecognizer:swipeLeft];
    [xb3 addGestureRecognizer:swipeRight];
    [xb3 addGestureRecognizer:swipeUp];
    [xb3 addGestureRecognizer:swipeDown];
    
    
    swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [xb4 addGestureRecognizer:swipeLeft];
    [xb4 addGestureRecognizer:swipeRight];
    [xb4 addGestureRecognizer:swipeUp];
    [xb4 addGestureRecognizer:swipeDown];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    const float baseHeight = 93.5;
    int now = swipe.view.tag;
    CGRect rect = swipe.view.frame;
    bool flag = true;
    switch(swipe.direction)
    {
        case UISwipeGestureRecognizerDirectionLeft:
            if(loc[now][1] == 0) break;
            for (int i = 0;i < loc[now][3] && flag;++i)
                if(mp[loc[now][0] + i][loc[now][1] - 1])
                    flag = false;
            if(!flag) break;
            for (int i = 0;i < loc[now][3] && flag;++i)
            {
                mp[loc[now][0] + i][loc[now][1] - 1] = now;
                mp[loc[now][0] + i][loc[now][1] + loc[now][2] - 1] = 0;
            }
            --loc[now][1];
            rect.origin.x -= baseHeight;
            [swipe.view setFrame:rect];
            NSLog(@"Swipe Left!");
            break;
        case UISwipeGestureRecognizerDirectionRight:
            if(loc[now][1] + loc[now][2] - 1 == 4) break;
            for (int i = 0;i < loc[now][3] && flag;++i)
                if(mp[loc[now][0] + i][loc[now][1] + loc[now][2]])
                    flag = false;
            if(!flag) break;
            for (int i = 0;i < loc[now][3] && flag;++i)
            {
                mp[loc[now][0] + i][loc[now][1] + loc[now][2]] = now;
                mp[loc[now][0] + i][loc[now][1]] = 0;
            }
            ++loc[now][1];
            rect.origin.x += baseHeight;
            [swipe.view setFrame:rect];
            NSLog(@"Swipe Right!");
            break;
        case UISwipeGestureRecognizerDirectionUp:
            if(loc[now][0] == 0) break;
            for (int i = 0;i < loc[now][2] && flag;++i)
                if(mp[loc[now][0] - 1][loc[now][1] + i])
                    flag = false;
            if(!flag) break;
            for (int i = 0;i < loc[now][2] && flag;++i)
            {
                mp[loc[now][0] - 1][loc[now][1] + i] = now;
                mp[loc[now][0] + loc[now][3] - 1][loc[now][1] + i] = 0;
            }
            --loc[now][0];
            rect.origin.y -= baseHeight;
            [swipe.view setFrame:rect];
            NSLog(@"Swipe Up!");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            if(loc[now][0] + loc[now][3] - 1 == 4) break;
            for (int i = 0;i < loc[now][2] && flag;++i)
                if(mp[loc[now][0] + loc[now][3]][loc[now][1] + i])
                    flag = false;
            if(!flag) break;
            for (int i = 0;i < loc[now][2] && flag;++i)
            {
                mp[loc[now][0] + loc[now][3]][loc[now][1] + i] = now;
                mp[loc[now][0]][loc[now][1] + i] = 0;
            }
            ++loc[now][0];
            rect.origin.y += baseHeight;
            [swipe.view setFrame:rect];
            NSLog(@"Swipe Down!");
            break;
        default:
            NSLog(@"unrecognized swipe gesture!");
    }
    if(loc[2][0] == 3 && loc[2][1] == 1) {
        [self showMessage: @"恭喜您已经成功完成了游戏!"];
    }
}

@end
