#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *portraitDisplay;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtons;
@property (strong, nonatomic) IBOutlet UIView *additionalOptions;

@end

