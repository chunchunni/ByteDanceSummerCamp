//
//  Person.m
//  Study_OC
//
//  Created by PURE on 2021/7/3.
//  Copyright © 2021 Big Nerd Ranch. All rights reserved.
//

#import "Person.h"

// .m用于实现类
// implementation部分，用于描述数据并实现声明中的方法
@implementation Person
 -(void)sayHi
{
    NSLog(@"Hi! I am %@, I am %d years old.", _name, _age);
}

@end
