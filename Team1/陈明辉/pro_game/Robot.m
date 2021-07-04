//
//  Robot.m
//  proj_1
//
//  Created by halo on 2021/7/4.
//  Copyright © 2021年 halo. All rights reserved.
//

#import "Robot.h"
#import "Player.h"
@implementation Robot
-(void)showFist{
    //1.随机出拳
    int robotSelect = arc4random_uniform(3)+1;
    //2.显示随机出的拳头
    NSString * type = [self fistTypeWithNumber:robotSelect];
    NSLog(@"机器人[%@]出的拳头是:@",_name,type);
    //3.将出的拳头保存到当前对象的属性中去
    _selectedType = robotSelect;
}
-(NSString *)fistTypeWithNumber:(int)number{
    switch (number) {
        case 1:
            return @"剪刀";
        case 2:
            return @"石头";
        default:
            return @"布";
    }
    return @"";
}
@end
