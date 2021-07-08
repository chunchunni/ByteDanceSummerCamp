//
//  main.m
//  Huarongdao
//
//  Created by Bill Haku on 2021/07/08.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int map[4][3];

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
