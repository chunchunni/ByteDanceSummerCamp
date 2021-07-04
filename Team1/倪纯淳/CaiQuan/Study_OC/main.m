//
//  main.m
//  Study_OC
//
//  Created by PURE on 2021/7/2.
//  Copyright © 2021 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
//OC中大小写敏感
#import "Person.h"
#import "Robot.h"
#import "Player.h"
#import "Judge.h"

int main(int argc, const char * argv[]) {
    /*
    // 自动释放池机制：创建新对象，有效管理内存
    @autoreleasepool {
        // @+字符串表示常量NSString对象；NSlog函数用于显示或记录其参数以及执行函数的时间、日期、程序名
        NSLog(@"Hello, World!");
        int sum;
        sum = 20 + 50;
        // %i表示整数
        NSLog(@"sum is %i",sum);
        
        Person *p1 = [Person new];
        p1->_name = @"Jack";
        p1->_age = 18;
        [p1 sayHi];
    }
    return 0;
    */
    Player *player = [Player new];
    player->_name = @"XiaoMing";
    Robot *robot = [Robot new];
    robot->_name = @"AlphaGo";
    Judge *judge = [Judge new];
    judge->_name = @"CaiPan";
    while(1)
    {
        [player showFirst];
        [robot showfirst];
        [judge caiJueWithPlay:player andRobot:robot];
        NSLog(@"Continue?y/n");
        char ans = 'a';
        rewind(stdin);
        scanf("%c", &ans);
        if (ans != 'y')
        {
            NSLog(@"See you.");
            break;
        }
    }
    return 0;
}

