//
//  SceneDelegate.m
//  SampleApp
//
//  Created by zsc on 2021/7/1.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"

@interface SceneDelegate ()<UITabBarControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    if (@available(ios 13, *)) {
             if (scene) {
                 self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
                 UITabBarController *tabbarController = [[UITabBarController alloc]init];
                 
                 GTNewsViewController *viewController = [[GTNewsViewController alloc] init];
                 
   
                 GTVideoViewController *videocontroller = [[GTVideoViewController alloc]init];

                 
                

                 tabbarController.delegate = self;
                 
                 UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
                 
                 [navigationController setNavigationBarHidden:NO];
                 [navigationController.navigationBar setTranslucent:YES];
                 [navigationController.navigationBar setBackgroundImage:[self createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
                 if([navigationController.navigationBar respondsToSelector:@selector(shadowImage)]){
                     [navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
                 }
                 tabbarController.tabBar.translucent = YES;
                 [tabbarController.tabBar setBackgroundImage:[self createImageWithColor:[UIColor clearColor]]];
                 if([tabbarController.tabBar respondsToSelector:@selector(shadowImage)]){
                     [tabbarController.tabBar setShadowImage:[[UIImage alloc]init]];
                 }
//                 UIImageView *backView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, tabbarController.tabBar.frame.size.width, tabbarController.tabBar.frame.size.height)];
//
//                 UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//                 UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:effect];
//                 effectView.frame =CGRectMake(0, 0, tabbarController.tabBar.frame.size.width, tabbarController.tabBar.frame.size.height);
//                 [backView addSubview:effectView];
//
//                 [tabbarController.tabBar insertSubview:backView atIndex:0];
//                 tabbarController.tabBar.backgroundImage = backView.image;
                 UIVisualEffectView *visualEffect = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
                 visualEffect.frame = CGRectMake(0, 0, tabbarController.tabBar.frame.size.width, tabbarController.tabBar.frame.size.height+50);
                 visualEffect.alpha = 0.5;
                 [tabbarController.tabBar addSubview:visualEffect];
                 
                 self.window.rootViewController = navigationController;
                 [tabbarController setViewControllers:@[viewController,videocontroller]];
                 [self.window makeKeyAndVisible];
             }
         }
}

-(UIImage*) createImageWithColor:(UIColor*) color
{
  CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
  UIGraphicsBeginImageContext(rect.size);
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(context, [color CGColor]);
  CGContextFillRect(context, rect);
  UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return theImage;
}
//-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    NSLog(@"did select");
//}


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
