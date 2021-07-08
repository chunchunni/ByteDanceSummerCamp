//
//  Block.m
//  Huarongdao
//
//  Created by Bill Haku on 2021/07/08.
//

#import <Foundation/Foundation.h>
#import "Block.h"

extern int map[4][3];

@implementation Block : NSObject 

- (int)locationX {
    return self.locationX;
}

- (int)locationY {
    return self.locationY;
}

- (int)extenX {
    return self.extenX;
}

- (int)extenY {
    return self.extenY;
}

- (BOOL)downMove {
    for(int i = 0; i < self.extenY; i++) {
        if(map[self.locationX][self.locationY + i]) {
            return false;
        }
    }
    self.locationY++;
}

- (void)leftMove {
    self.locationX--;
}

- (void)rightMove {
    self.locationX++;
}

- (void)upMove {
    self.locationY--;
}

- (void)initLocation {
    for(int i = 0; i < self.extenX; i++) {
        map[self.locationX + i][self.locationY] = 1;
    }
    for(int i = 0; i < self.extenY; i++) {
        map[self.locationX][self.locationY + i] = 1;
    }
}
@end
