//
//  Player.m
//  proj_1
//
//  Created by halo on 2021/7/3.
//  Copyright © 2021年 halo. All rights reserved.
//

#import "Player.h"

@implementation Player
-(void)showFist{
    //1.提示用户选择拳头
    NSLog(@"亲爱的玩家[%@],请选择你要出的拳头，1.拳头。  2.石头。   3.布",_name);
    //接受用户输入拳头
    int userSelect = 0;
    scanf("%d",&userSelect);
    //3.显示用户选择拳头
    NSString *fistType = [self fistTypeWithNumber:userSelect];
    NSLog(@"玩家[%@]出的拳头是:%@",_name,fistType);
    //4.将用户选择的拳头存储在当前对象的属性中
    _selectedType = userSelect;
    
}
-(NSString *)fistTypeWithNumber:(int)number{
    switch(number){
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
