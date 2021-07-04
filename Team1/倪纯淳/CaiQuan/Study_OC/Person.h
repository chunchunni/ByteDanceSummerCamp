//
//  Person.h
//  Study_OC
//
//  Created by PURE on 2021/7/3.
//  Copyright © 2021 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

//  .h用于声明类
// interface部分，用于声明类和方法
@interface Person : NSObject
{
    @public
    NSString *_name;
    int  _age;
    
}

-(void)sayHi;

@end
