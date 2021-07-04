//
//  Player.h
//  proj_1
//
//  Created by halo on 2021/7/3.
//  Copyright © 2021年 halo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FistType.h"
@interface Player : NSObject
{
    @public
    NSString *_name;
    int _score;
    FistType _selectedType;//选择的拳头
}
-(void)showFist;
//根据传入的整数型返回字符串拳头
-(NSString *)fistTypeWithNumber:(int)number;

@end
