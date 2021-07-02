//
//  SceneDelegate.m
//  SampleApp
//
//  Created by zsc on 2021/7/1.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    if (@available(ios 13, *)) {
             if (scene) {
                 self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
//                 self.window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//                 UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[UIViewController alloc]init]];
                 UITabBarController *tabbarController = [[UITabBarController alloc]init];
                 
                 ViewController *viewController = [[ViewController alloc] init];
                 
                 UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                 
                 //UIViewController *controller1 = [[UIViewController alloc]init];
                 //controller1.view.backgroundColor = [UIColor redColor];
                 navigationController.tabBarItem.title = @"新闻";
                 navigationController.tabBarItem.image = [UIImage imageNamed:@"icon/page@2x.png"];
                 navigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon/page_selected@2x.png"];
                 
                 UIViewController *controller2 = [[UIViewController alloc]init];
                 controller2.view.backgroundColor = [UIColor yellowColor];
                 controller2.tabBarItem.title = @"视频";
                 controller2.tabBarItem.image = [UIImage imageNamed:@"icon/video@2x.png"];
                 controller2.tabBarItem.selectedImage = [UIImage imageNamed:@"icon/video_selected@2x.png"];
                 
                 UIViewController *controller3 = [[UIViewController alloc]init];
                 controller3.view.backgroundColor = [UIColor greenColor];
                 controller3.tabBarItem.title = @"推荐";
                 controller3.tabBarItem.image = [UIImage imageNamed:@"icon/like@2x.png"];
                 controller3.tabBarItem.selectedImage = [UIImage imageNamed:@"icon/like_selected@2x.png"];
                 
                 UIViewController *controller4 = [[UIViewController alloc]init];
                 controller4.view.backgroundColor = [UIColor grayColor];
                 controller4.tabBarItem.title = @"我的";
                 controller4.tabBarItem.image = [UIImage imageNamed:@"icon/home@2x.png"];
                 controller4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon/home_selected@2x.png"];
                 
                 
                 [tabbarController setViewControllers:@[navigationController,controller2,controller3,controller4]];
                 
                 
                 
                 self.window.rootViewController = tabbarController;
                 [self.window makeKeyAndVisible];
             }
         }
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.

    // Save changes in the application's managed object context when the application transitions to the background.
    [(AppDelegate *)UIApplication.sharedApplication.delegate saveContext];
}


@end
