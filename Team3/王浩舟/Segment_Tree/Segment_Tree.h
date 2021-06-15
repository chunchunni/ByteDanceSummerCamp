//
//  Fraction.h
//  study
//
//  Created by Admin on 2021/6/13.
//

#import <Foundation/Foundation.h>

@interface Segment_Tree: NSObject

-(void) push_up: (int) rt;
-(void) push_down: (int) rt : (int) num;
-(void) build: (int) rt : (int) l : (int) r;
-(void) update: (int) rt : (int) l : (int) r : (int) L : (int) R : (int) val;
-(int) query: (int) rt : (int) l : (int) r : (int) L : (int) R;

@end
