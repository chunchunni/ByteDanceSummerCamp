//
//  main.m
//  Weather
//
//  Created by Admin on 2021/7/15.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    ViewController *a = [ViewController new];
    [a getAFNetworking];
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
