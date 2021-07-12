//
//  main.m
//  Huarongdao
//
//  Created by Bill Haku on 2021/07/08.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Block.h"

int map[5][4];

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        
        Block *block0 = [Block new];
        Block *block1 = [Block new];
        Block *block2 = [Block new];
        Block *block3 = [Block new];
        Block *block4 = [Block new];
        Block *block5 = [Block new];
        Block *block6 = [Block new];
        Block *block7 = [Block new];
        Block *block8 = [Block new];
        Block *block9 = [Block new];
        [block0 setInfo:2 :1 :2 :2];
        [block1 setInfo:2 :4 :2 :1];
        [block2 setInfo:1 :1 :1 :2];
        [block3 setInfo:4 :1 :1 :2];
        [block4 setInfo:1 :3 :1 :2];
        [block5 setInfo:4 :3 :1 :2];
        [block6 setInfo:1 :5 :1 :1];
        [block7 setInfo:2 :5 :1 :1];
        [block8 setInfo:3 :5 :1 :1];
        [block9 setInfo:4 :5 :1 :1];
        [block0 initLocation];
        [block1 initLocation];
        [block2 initLocation];
        [block3 initLocation];
        [block4 initLocation];
        [block5 initLocation];
        [block6 initLocation];
        [block7 initLocation];
        [block8 initLocation];
        [block9 initLocation];
        
        for(int i = 1; i <= 5; i++) {
            for(int j = 1; j <= 4; j++) {
                printf("%i", map[j][i]);
            }
            printf("\n");
        }
        
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
