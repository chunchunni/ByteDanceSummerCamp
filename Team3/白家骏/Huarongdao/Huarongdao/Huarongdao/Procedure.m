//
//  Procedure.m
//  Huarongdao
//
//  Created by Bill Haku on 2021/07/14.
//

#import <Foundation/Foundation.h>
#import "Procedure.h"

@implementation procedure {
    int tag[MAXN];
    int direction[MAXN];
}

- (int) tag:(int)i {
    return tag[i];
}

- (int) direction:(int)i {
    return direction[i];
}

- (BOOL) writeDir:(int)i :(int) value {
    direction[i] = value;
}

- (BOOL) writeTag:(int)i :(int)value {
    tag[i] = value;
}

@end
