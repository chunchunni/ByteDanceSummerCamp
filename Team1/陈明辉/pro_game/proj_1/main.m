//
//  main.m
//  proj_1
//
//  Created by halo on 2021/7/2.
//  Copyright © 2021年 halo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"Robot.h"
#import"Player.h"
#import "Judge.h"
int main(int argc, const char * argv[]) {
    //玩家
    Player *player =[Player new];
    player->_name = @"李华";
    //机器人
    Robot *robot = [Robot new];
    robot->_name =@"阿法狗";
    //裁判
    Judge *judge = [Judge new];
    judge->_name = @"黑哨";
    //通过循环使得游戏进行
    while(1){
        //玩家出拳
        [player showFist];
        //机器人出拳
        [robot showFist];
        //裁判判断输赢
        [judge caiJueWithPlay:player andRobot:robot];
	       NSLog(@"请问还要继续吗？y/n");
        char ans = 'a';
        rewind(stdin);
        scanf("%c",&ans);
        if(ans!='y'){
            NSLog(@"欢迎下次来玩");
            break;
        }
    }
    return 0;
}
