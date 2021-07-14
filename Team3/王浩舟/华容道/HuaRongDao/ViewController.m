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

@synthesize cc,hz,zf,mc,gy,zy,xb1,xb2,xb3,xb4,finishbutton,allview;

struct bfsmap
{
    int op, dir, mp[5][4], fr, loc[11][4];
};

int mp[5][4] = {
    1,2,2,3,
    1,2,2,3,
    4,0,0,6,
    4,5,5,6,
    7,8,9,10
};
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

bool finishing = false;

-(IBAction) clickfinish
{
    NSMutableDictionary *vis = [NSMutableDictionary dictionary];
    finishbutton.enabled = false;
    finishing = true;
    NSMutableArray *q = [[NSMutableArray alloc] init];
    struct bfsmap tmp;
    memcpy(tmp.mp,mp,sizeof mp);
    memcpy(tmp.loc,loc,sizeof loc);
    NSMutableArray *hasharray1 = [NSMutableArray array];
    for (int i = 0; i < 5; ++i)
        for (int j = 0; j < 4; ++j)
            [hasharray1 addObject:[[NSNumber alloc] initWithInt:(mp[i][j]>=7?7:(mp[i][j]==2?2:(mp[i][j]==5?5:(mp[i][j]==0?0:1))))]];
    NSString *hashstr1 = [NSString stringWithString:[hasharray1 componentsJoinedByString:@"."]];
    NSLog(@"%@",hashstr1);
    [vis setObject:@"1" forKey:hashstr1];
    [q addObject:[NSValue value:&tmp withObjCType:@encode(struct bfsmap)]];
    int l = 0, r = 1, ans = 0;
    while(l < r)
    {
        struct bfsmap nowbfs;
        [[q objectAtIndex:l] getValue:&nowbfs];
        if(nowbfs.loc[2][0] == 3 && nowbfs.loc[2][1] == 1)
        {
            ans = l;
            break;
        }
        if(l % 10000 == 0 || l <= 10)
        {
            NSLog(@"map of %d:",l);
            for (int i = 0; i < 5; ++i)
            {
                for (int j = 0; j < 4; ++j)
                    printf("%3d",nowbfs.mp[i][j]);
                printf("\n");
            }
            /*
            NSLog(@"loc of %d:",l);
            for (int i = 1; i < 11; ++i)
            {
                for (int j = 0; j < 4; ++j)
                    printf("%d",nowbfs.loc[i][j]);
                printf("\n");
            }
            */
        }
        for (int now = 1; now <= 10; ++now)
        {
            bool flag = true;
            {
                if(nowbfs.loc[now][1] != 0)
                {
                    for (int i = 0;i < nowbfs.loc[now][3] && flag;++i)
                        if(nowbfs.mp[nowbfs.loc[now][0] + i][nowbfs.loc[now][1] - 1])
                            flag = false;
                    if(flag)
                    {
                        struct bfsmap tmp2;
                        memcpy(tmp2.mp,nowbfs.mp,sizeof tmp2.mp);
                        memcpy(tmp2.loc,nowbfs.loc,sizeof tmp2.loc);
                        tmp2.op = now;
                        tmp2.dir = 1; //1left 2right 3up 4down
                        tmp2.fr = l;
                        for (int i = 0;i < tmp2.loc[now][3];++i)
                        {
                            tmp2.mp[tmp2.loc[now][0] + i][tmp2.loc[now][1] - 1] = now;
                            tmp2.mp[tmp2.loc[now][0] + i][tmp2.loc[now][1] + tmp2.loc[now][2] - 1] = 0;
                        }
                        --tmp2.loc[now][1];
                        NSMutableArray *hasharray = [NSMutableArray array];
                        for (int i = 0; i < 5; ++i)
                            for (int j = 0; j < 4; ++j)
                                [hasharray addObject:[[NSNumber alloc] initWithInt:(tmp2.mp[i][j]>=7?7:(tmp2.mp[i][j]==2?2:(tmp2.mp[i][j]==5?5:(tmp2.mp[i][j]==0?0:1))))]];
                        NSString *hashstr = [NSString stringWithString:[hasharray componentsJoinedByString:@"."]];
                        if([vis objectForKey:hashstr] == nil)
                        {
                            [vis setObject:@"1" forKey:hashstr];
                            [q addObject:[NSValue value:&tmp2 withObjCType:@encode(struct bfsmap)]];
                        }
                        ++r;
                    }
                }
            }
            flag = true;
            {
                if(nowbfs.loc[now][1] + nowbfs.loc[now][2] - 1 != 3)
                {
                    for (int i = 0;i < nowbfs.loc[now][3] && flag;++i)
                        if(nowbfs.mp[nowbfs.loc[now][0] + i][nowbfs.loc[now][1] + nowbfs.loc[now][2]])
                            flag = false;
                    if(flag)
                    {
                        struct bfsmap tmp2;
                        memcpy(tmp2.mp,nowbfs.mp,sizeof tmp2.mp);
                        memcpy(tmp2.loc,nowbfs.loc,sizeof tmp2.loc);
                        tmp2.op = now;
                        tmp2.dir = 2; //1left 2right 3up 4down
                        tmp2.fr = l;
                        for (int i = 0;i < tmp2.loc[now][3];++i)
                        {
                            tmp2.mp[tmp2.loc[now][0] + i][tmp2.loc[now][1] + tmp2.loc[now][2]] = now;
                            tmp2.mp[tmp2.loc[now][0] + i][tmp2.loc[now][1]] = 0;
                        }
                        ++tmp2.loc[now][1];
                        NSMutableArray *hasharray = [NSMutableArray array];
                        for (int i = 0; i < 5; ++i)
                            for (int j = 0; j < 4; ++j)
                                [hasharray addObject:[[NSNumber alloc] initWithInt:(tmp2.mp[i][j]>=7?7:(tmp2.mp[i][j]==2?2:(tmp2.mp[i][j]==5?5:(tmp2.mp[i][j]==0?0:1))))]];
                        NSString *hashstr = [NSString stringWithString:[hasharray componentsJoinedByString:@"."]];
                        if([vis objectForKey:hashstr] == nil)
                        {
                            [vis setObject:@"1" forKey:hashstr];
                            [q addObject:[NSValue value:&tmp2 withObjCType:@encode(struct bfsmap)]];
                        }
                        ++r;
                    }
                }
            }
            flag = true;
            {
                if(nowbfs.loc[now][0] != 0)
                {
                    for (int i = 0;i < nowbfs.loc[now][2] && flag;++i)
                        if(nowbfs.mp[nowbfs.loc[now][0] - 1][nowbfs.loc[now][1] + i])
                            flag = false;
                    if(flag)
                    {
                        struct bfsmap tmp2;
                        memcpy(tmp2.mp,nowbfs.mp,sizeof tmp2.mp);
                        memcpy(tmp2.loc,nowbfs.loc,sizeof tmp2.loc);
                        tmp2.op = now;
                        tmp2.dir = 3; //1left 2right 3up 4down
                        tmp2.fr = l;
                        for (int i = 0;i < tmp2.loc[now][2];++i)
                        {
                            tmp2.mp[tmp2.loc[now][0] - 1][tmp2.loc[now][1] + i] = now;
                            tmp2.mp[tmp2.loc[now][0] + tmp2.loc[now][3] - 1][tmp2.loc[now][1] + i] = 0;
                        }
                        --tmp2.loc[now][0];
                        NSMutableArray *hasharray = [NSMutableArray array];
                        for (int i = 0; i < 5; ++i)
                            for (int j = 0; j < 4; ++j)
                                 [hasharray addObject:[[NSNumber alloc] initWithInt:(tmp2.mp[i][j]>=7?7:(tmp2.mp[i][j]==2?2:(tmp2.mp[i][j]==5?5:(tmp2.mp[i][j]==0?0:1))))]];
                        NSString *hashstr = [NSString stringWithString:[hasharray componentsJoinedByString:@"."]];
                        if([vis objectForKey:hashstr] == nil)
                        {
                            [vis setObject:@"1" forKey:hashstr];
                            [q addObject:[NSValue value:&tmp2 withObjCType:@encode(struct bfsmap)]];
                        }
                        ++r;
                    }
                }
            }
            flag = true;
            {
                if(nowbfs.loc[now][0] + nowbfs.loc[now][3] - 1 != 4)
                {
                    for (int i = 0;i < nowbfs.loc[now][2] && flag;++i)
                        if(nowbfs.mp[nowbfs.loc[now][0] + nowbfs.loc[now][3]][nowbfs.loc[now][1] + i])
                            flag = false;
                    if(flag)
                    {
                        struct bfsmap tmp2;
                        memcpy(tmp2.mp,nowbfs.mp,sizeof tmp2.mp);
                        memcpy(tmp2.loc,nowbfs.loc,sizeof tmp2.loc);
                        tmp2.op = now;
                        tmp2.dir = 4; //1left 2right 3up 4down
                        tmp2.fr = l;
                        for (int i = 0;i < tmp2.loc[now][2];++i)
                        {
                            tmp2.mp[tmp2.loc[now][0] + tmp2.loc[now][3]][tmp2.loc[now][1] + i] = now;
                            tmp2.mp[tmp2.loc[now][0]][tmp2.loc[now][1] + i] = 0;
                        }
                        ++tmp2.loc[now][0];
                        NSMutableArray *hasharray = [NSMutableArray array];
                        for (int i = 0; i < 5; ++i)
                            for (int j = 0; j < 4; ++j)
                                 [hasharray addObject:[[NSNumber alloc] initWithInt:(tmp2.mp[i][j]>=7?7:(tmp2.mp[i][j]==2?2:(tmp2.mp[i][j]==5?5:(tmp2.mp[i][j]==0?0:1))))]];
                        NSString *hashstr = [NSString stringWithString:[hasharray componentsJoinedByString:@"."]];
                        if([vis objectForKey:hashstr] == nil)
                        {
                            [vis setObject:@"1" forKey:hashstr];
                            [q addObject:[NSValue value:&tmp2 withObjCType:@encode(struct bfsmap)]];
                        }
                        ++r;
                    }
                }
            }
        }
        ++l;
    }
    NSMutableArray *recv = [[NSMutableArray alloc] init];
    NSString *name_table[] = {@"blank", @"zf", @"cc", @"mc", @"hz", @"gy", @"zy", @"xb1", @"xb2", @"xb3", @"xb4"};
    NSString *dir_name[] = {@"blank", @"left", @"right", @"up", @"down"};
    struct bfsmap bfstmp;
    [[q objectAtIndex:ans] getValue:&bfstmp];
    memcpy(loc,bfstmp.loc,sizeof loc);
    memcpy(mp,bfstmp.mp,sizeof mp);
    while(ans > 0)
    {
        NSNumber *NSans = [[NSNumber alloc] initWithInt:ans];
        [recv addObject:NSans];
        struct bfsmap nowbfs;
        [[q objectAtIndex:ans] getValue:&nowbfs];
        NSLog(@"ans %d[%s %s] -> ",ans,[name_table[nowbfs.op] UTF8String], [dir_name[nowbfs.dir] UTF8String]);
        ans = nowbfs.fr;
    }
    const float baseHeight = 93.5;
    float delay = 0;
    CGRect Rect[11];
    Rect[1] = zf.frame;
    Rect[2] = cc.frame;
    Rect[3] = mc.frame;
    Rect[4] = hz.frame;
    Rect[5] = gy.frame;
    Rect[6] = zy.frame;
    Rect[7] = xb1.frame;
    Rect[8] = xb2.frame;
    Rect[9] = xb3.frame;
    Rect[10] = xb4.frame;
    for (int i = (int)[recv count] - 1; i >= 0; --i)
    {
        int loc1 = [[recv objectAtIndex:i] intValue];
        struct bfsmap nowbfs;
        [[q objectAtIndex:loc1] getValue:&nowbfs];
        // // 1zf 2cc 3mc 4hz 5gy 6zy 7xb1 8xb2 9xb3 10xb4
        NSLog(@"perform: %s %s",[name_table[nowbfs.op] UTF8String], [dir_name[nowbfs.dir] UTF8String]);
        switch(nowbfs.op)
        {
            case 1:
            {
                switch(nowbfs.dir)
                {
                    case 1:
                    {
                        Rect[1].origin.x -= baseHeight;
                        break;
                    }
                    case 2:
                    {
                        Rect[1].origin.x += baseHeight;
                        break;
                    }
                    case 3:
                    {
                        Rect[1].origin.y -= baseHeight;
                        break;
                    }
                    case 4:
                    {
                        Rect[1].origin.y += baseHeight;
                        break;
                    }
                }
                CGRect rect = Rect[1];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delay += 0.3) * NSEC_PER_SEC)),dispatch_get_main_queue(),^{[zf setFrame:rect];});
                break;
            }
            case 2:
            {
                switch(nowbfs.dir)
                {
                    case 1:
                    {
                        Rect[2].origin.x -= baseHeight;
                        break;
                    }
                    case 2:
                    {
                        Rect[2].origin.x += baseHeight;
                        break;
                    }
                    case 3:
                    {
                        Rect[2].origin.y -= baseHeight;
                        break;
                    }
                    case 4:
                    {
                        Rect[2].origin.y += baseHeight;
                        break;
                    }
                }
                CGRect rect = Rect[2];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delay += 0.3) * NSEC_PER_SEC)),dispatch_get_main_queue(),^{[cc setFrame:rect];});
                break;
            }
            case 3:
            {
                switch(nowbfs.dir)
                {
                    case 1:
                    {
                        Rect[3].origin.x -= baseHeight;
                        break;
                    }
                    case 2:
                    {
                        Rect[3].origin.x += baseHeight;
                        break;
                    }
                    case 3:
                    {
                        Rect[3].origin.y -= baseHeight;
                        break;
                    }
                    case 4:
                    {
                        Rect[3].origin.y += baseHeight;
                        break;
                    }
                }
                CGRect rect = Rect[3];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delay += 0.3) * NSEC_PER_SEC)),dispatch_get_main_queue(),^{[mc setFrame:rect];});
                break;
            }
            case 4:
            {
                switch(nowbfs.dir)
                {
                    case 1:
                    {
                        Rect[4].origin.x -= baseHeight;
                        break;
                    }
                    case 2:
                    {
                        Rect[4].origin.x += baseHeight;
                        break;
                    }
                    case 3:
                    {
                        Rect[4].origin.y -= baseHeight;
                        break;
                    }
                    case 4:
                    {
                        Rect[4].origin.y += baseHeight;
                        break;
                    }
                }
                CGRect rect = Rect[4];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delay += 0.3) * NSEC_PER_SEC)),dispatch_get_main_queue(),^{[hz setFrame:rect];});
                break;
            }
            case 5:
            {
                switch(nowbfs.dir)
                {
                    case 1:
                    {
                        Rect[5].origin.x -= baseHeight;
                        break;
                    }
                    case 2:
                    {
                        Rect[5].origin.x += baseHeight;
                        break;
                    }
                    case 3:
                    {
                        Rect[5].origin.y -= baseHeight;
                        break;
                    }
                    case 4:
                    {
                        Rect[5].origin.y += baseHeight;
                        break;
                    }
                }
                CGRect rect = Rect[5];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delay += 0.3) * NSEC_PER_SEC)),dispatch_get_main_queue(),^{[gy setFrame:rect];});
                break;
            }
            case 6:
            {
                switch(nowbfs.dir)
                {
                    case 1:
                    {
                        Rect[6].origin.x -= baseHeight;
                        break;
                    }
                    case 2:
                    {
                        Rect[6].origin.x += baseHeight;
                        break;
                    }
                    case 3:
                    {
                        Rect[6].origin.y -= baseHeight;
                        break;
                    }
                    case 4:
                    {
                        Rect[6].origin.y += baseHeight;
                        break;
                    }
                }
                CGRect rect = Rect[6];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delay += 0.3) * NSEC_PER_SEC)),dispatch_get_main_queue(),^{[zy setFrame:rect];});
                break;
            }
            case 7:
            {
                switch(nowbfs.dir)
                {
                    case 1:
                    {
                        Rect[7].origin.x -= baseHeight;
                        break;
                    }
                    case 2:
                    {
                        Rect[7].origin.x += baseHeight;
                        break;
                    }
                    case 3:
                    {
                        Rect[7].origin.y -= baseHeight;
                        break;
                    }
                    case 4:
                    {
                        Rect[7].origin.y += baseHeight;
                        break;
                    }
                }
                CGRect rect = Rect[7];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delay += 0.3) * NSEC_PER_SEC)),dispatch_get_main_queue(),^{[xb1 setFrame:rect];});
                break;
            }
            case 8:
            {
                switch(nowbfs.dir)
                {
                    case 1:
                    {
                        Rect[8].origin.x -= baseHeight;
                        break;
                    }
                    case 2:
                    {
                        Rect[8].origin.x += baseHeight;
                        break;
                    }
                    case 3:
                    {
                        Rect[8].origin.y -= baseHeight;
                        break;
                    }
                    case 4:
                    {
                        Rect[8].origin.y += baseHeight;
                        break;
                    }
                }
                CGRect rect = Rect[8];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delay += 0.3) * NSEC_PER_SEC)),dispatch_get_main_queue(),^{[xb2 setFrame:rect];});
                break;
            }
            case 9:
            {
                switch(nowbfs.dir)
                {
                    case 1:
                    {
                        Rect[9].origin.x -= baseHeight;
                        break;
                    }
                    case 2:
                    {
                        Rect[9].origin.x += baseHeight;
                        break;
                    }
                    case 3:
                    {
                        Rect[9].origin.y -= baseHeight;
                        break;
                    }
                    case 4:
                    {
                        Rect[9].origin.y += baseHeight;
                        break;
                    }
                }
                CGRect rect = Rect[9];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delay += 0.3) * NSEC_PER_SEC)),dispatch_get_main_queue(),^{[xb3 setFrame:rect];});
                break;
            }
            case 10:
            {
                switch(nowbfs.dir)
                {
                    case 1:
                    {
                        Rect[10].origin.x -= baseHeight;
                        break;
                    }
                    case 2:
                    {
                        Rect[10].origin.x += baseHeight;
                        break;
                    }
                    case 3:
                    {
                        Rect[10].origin.y -= baseHeight;
                        break;
                    }
                    case 4:
                    {
                        Rect[10].origin.y += baseHeight;
                        break;
                    }
                }
                CGRect rect = Rect[10];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delay += 0.3) * NSEC_PER_SEC)),dispatch_get_main_queue(),^{[xb4 setFrame:rect];});
                break;
            }
        }
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delay += 0.3) * NSEC_PER_SEC)),dispatch_get_main_queue(),^{
        [self showMessage:@"已经自动完成游戏！"];
        finishing = false;
        finishbutton.enabled = true;
    });
    
}

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
    if(finishing)
    {
        [self showMessage:@"游戏正在自动完成中，请不要尝试移动方块哦！"];
        return ;
    }
    const float baseHeight = 93.5;
    int now = (int) swipe.view.tag;
    CGRect rect = swipe.view.frame;
    bool flag = true;
    switch(swipe.direction)
    {
        case UISwipeGestureRecognizerDirectionLeft:
        {
            if(loc[now][1] == 0) break;
            for (int i = 0;i < loc[now][3] && flag;++i)
                if(mp[loc[now][0] + i][loc[now][1] - 1])
                    flag = false;
            if(!flag) break;
            for (int i = 0;i < loc[now][3];++i)
            {
                mp[loc[now][0] + i][loc[now][1] - 1] = now;
                mp[loc[now][0] + i][loc[now][1] + loc[now][2] - 1] = 0;
            }
            --loc[now][1];
            rect.origin.x -= baseHeight;
            [swipe.view setFrame:rect];
            NSLog(@"Swipe Left!");
            break;
        }
        case UISwipeGestureRecognizerDirectionRight:
        {
            if(loc[now][1] + loc[now][2] - 1 == 3) break;
            for (int i = 0;i < loc[now][3] && flag;++i)
                if(mp[loc[now][0] + i][loc[now][1] + loc[now][2]])
                    flag = false;
            if(!flag) break;
            for (int i = 0;i < loc[now][3];++i)
            {
                mp[loc[now][0] + i][loc[now][1] + loc[now][2]] = now;
                mp[loc[now][0] + i][loc[now][1]] = 0;
            }
            ++loc[now][1];
            rect.origin.x += baseHeight;
            [swipe.view setFrame:rect];
            NSLog(@"Swipe Right!");
            break;
        }
        case UISwipeGestureRecognizerDirectionUp:
        {
            if(loc[now][0] == 0) break;
            for (int i = 0;i < loc[now][2] && flag;++i)
                if(mp[loc[now][0] - 1][loc[now][1] + i])
                    flag = false;
            if(!flag) break;
            for (int i = 0;i < loc[now][2];++i)
            {
                mp[loc[now][0] - 1][loc[now][1] + i] = now;
                mp[loc[now][0] + loc[now][3] - 1][loc[now][1] + i] = 0;
            }
            --loc[now][0];
            rect.origin.y -= baseHeight;
            [swipe.view setFrame:rect];
            NSLog(@"Swipe Up!");
            break;
        }
        case UISwipeGestureRecognizerDirectionDown:
        {
            if(loc[now][0] + loc[now][3] - 1 == 4) break;
            for (int i = 0;i < loc[now][2] && flag;++i)
                if(mp[loc[now][0] + loc[now][3]][loc[now][1] + i])
                    flag = false;
            if(!flag) break;
            for (int i = 0;i < loc[now][2];++i)
            {
                mp[loc[now][0] + loc[now][3]][loc[now][1] + i] = now;
                mp[loc[now][0]][loc[now][1] + i] = 0;
            }
            ++loc[now][0];
            rect.origin.y += baseHeight;
            [swipe.view setFrame:rect];
            NSLog(@"Swipe Down!");
            break;
        }
        default:
            NSLog(@"unrecognized swipe gesture!");
    }
    if(loc[2][0] == 3 && loc[2][1] == 1) {
        if(finishing)
        {
            [self showMessage:@"已经自动完成游戏！"];
            finishing = false;
        } else [self showMessage: @"恭喜您已经成功完成了游戏!"];
    }
}

@end
