//
//  Judge.m
//  proj_1
//
//  Created by halo on 2021/7/4.
//  Copyright © 2021年 halo. All rights reserved.
//

#import "Judge.h"

@implementation Judge
-(void)caiJueWithPlay:(Player *)player andRobot:(Robot *)robot{
    //首先得到机器人和玩家的拳头
    FistType playerType = player->_selectedType;
    FistType robotType = robot->_selectedType;
    //其次判断输赢，为胜利的一方加分，显示结果
    if(playerType-robotType == -2||playerType-robotType==1){//玩家赢的情况
        NSLog(@"恭喜玩家[%@]获得胜利",player->_name);
        player->_score++;
    }else if(playerType==robotType){//平局
        NSLog(@"平局");
    }else{  //机器人赢
        NSLog(@"恭喜机器人[%@]获得胜利",robot->_name);
        robot->_score++;
    }
    //最后显示分数
    NSLog(@"--玩家[%@]:[%d]-------机器人:[%@]:[%d]",player->_name,player->_score,robot->_name,robot->_score);
              
}
@end
