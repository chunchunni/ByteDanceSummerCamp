//
//  Person.h
//  proj_1
//
//  Created by halo on 2021/7/3.
//  Copyright © 2021年 halo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    NSString * _name; //名字
    int _age; //年龄
    float _height; //身高
}

-(void)run;
-(void)sayHi;
-(void)ad;
-(void)sumWith;
@end
