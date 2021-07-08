//
//  Block.h
//  Huarongdao
//
//  Created by Bill Haku on 2021/07/08.
//

#import <Foundation/Foundation.h>
#ifndef Block_h
#define Block_h

@interface Block : NSObject

@property int locationX ;
@property int locationY;
@property int extenX;
@property int extenY;
- (int)locationX;
- (int)locationY;
- (int)extenX;
- (int)extenY;
- (BOOL)leftMove;
- (void)rightMove;
- (void)downMove;
- (void)upMove;
- (void)initLocation;

@end
#endif /* Block_h */
