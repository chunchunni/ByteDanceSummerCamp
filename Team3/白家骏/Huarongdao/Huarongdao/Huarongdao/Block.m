//
//  Block.m
//  Huarongdao
//
//  Created by Bill Haku on 2021/07/08.
//

#import <Foundation/Foundation.h>
#import "Block.h"

extern int map[4][3];

@implementation Block : NSObject {
    int locationX;
    int locationY;
    int extenX;
    int extenY;
}

- (int)locationX {
    return locationX;
}

- (int)locationY {
    return locationY;
}

- (int)extenX {
    return extenX;
}

- (int)extenY {
    return extenY;
}

- (BOOL)downMove {
    for(int i = 0; i < extenX; i++) {
        if(map[locationX + i][locationY + extenY]) {
            return NO;
        }
    }
    for(int i = 0; i < extenX; i++) {
        for(int j = 0; j < extenY; j++) {
            map[locationX + i][locationY + j] = 0;
        }
    }
    locationY++;
    for(int i = 0; i < extenX; i++) {
        for(int j = 0; j < extenY; j++) {
            map[locationX + i][locationY + j] = 1;
        }
    }
    return YES;
}

- (BOOL)leftMove {
    for(int i = 0; i < extenY; i++) {
        if(map[locationX - 1][locationY + i]) {
            return NO;
        }
    }
    for(int i = 0; i < extenX; i++) {
        for(int j = 0; j < extenY; j++) {
            map[locationX + i][locationY + j] = 0;
        }
    }
    locationX--;
    for(int i = 0; i < extenX; i++) {
        for(int j = 0; j < extenY; j++) {
            map[locationX + i][locationY + j] = 1;
        }
    }
    return YES;
}

- (BOOL)rightMove {
    for(int i = 0; i < extenY; i++) {
        if(map[locationX + extenX][locationY + i]) {
            return NO;
        }
    }
    for(int i = 0; i < extenX; i++) {
        for(int j = 0; j < extenY; j++) {
            map[locationX + i][locationY + j] = 0;
        }
    }
    locationX++;
    for(int i = 0; i < extenX; i++) {
        for(int j = 0; j < extenY; j++) {
            map[locationX + i][locationY + j] = 1;
        }
    }
    return YES;
}

- (BOOL)upMove {
    for(int i = 0; i < extenX; i++) {
        if(map[locationX + i][locationY - 1]) {
            return NO;
        }
    }
    for(int i = 0; i < extenX; i++) {
        for(int j = 0; j < extenY; j++) {
            map[locationX + i][locationY + j] = 0;
        }
    }
    locationY--;
    for(int i = 0; i < extenX; i++) {
        for(int j = 0; j < extenY; j++) {
            map[locationX + i][locationY + j] = 1;
        }
    }
    return YES;
}

- (BOOL)initLocation {
    for(int i = 0; i < extenX; i++) {
        for(int j = 0; j < extenY; j++) {
            if(!map[locationX + i][locationY + j]) {
                map[locationX + i][locationY + j] = 1;
            }
            else {
                return NO;
            }
        }
    }
    return YES;
}
@end
