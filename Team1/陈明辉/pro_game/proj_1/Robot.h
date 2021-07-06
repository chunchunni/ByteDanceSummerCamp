//
//  Robot.h
//  proj_1
//
//  Created by halo on 2021/7/4.
//  Copyright © 2021年 halo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FistType.h"
@interface Robot : NSObject{
    @public
    NSString * _name;//机器人的姓名
    int _score;//机器人的得分
    FistType _selectedType; //机器人选择的拳头
}
-(void)showFist;
-(NSString *)fistTypeWithNumber:(int)number;

@end
