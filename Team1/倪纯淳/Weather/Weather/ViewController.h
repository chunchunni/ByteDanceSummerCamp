//
//  ViewController.h
//  Weather
//
//  Created by PURE on 2021/7/16.
//  Copyright © 2021 PURE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction) buttonPressed:(UIButton *)sender;
- (void)loadData;

@end

