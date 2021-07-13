//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by zsc on 2021/7/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView
//-(void)showDeleteView;

-(void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock;
@end

NS_ASSUME_NONNULL_END
