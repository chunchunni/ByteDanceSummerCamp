//
//  Procedure.h
//  Huarongdao
//
//  Created by Bill Haku on 2021/07/14.
//

#import <Foundation/Foundation.h>
#define MAXN 100000

@interface procedure : NSObject

- (int) tag: (int) i;
- (int) direction: (int) i;
- (BOOL) writeTag: (int) i : (int) value;
- (BOOL) writeDir: (int) i : (int) value;

@end
