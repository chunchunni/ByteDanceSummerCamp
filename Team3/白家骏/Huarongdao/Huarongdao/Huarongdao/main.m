//
//  main.m
//  Huarongdao
//
//  Created by Bill Haku on 2021/07/08.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Block.h"
#import "Procedure.h"

int map[5][4];
struct path {
    int obj[MAXN];
    int dir[MAXN];
};

void printmap();
void bfs();

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        
        Block *block0 = [Block new];
        Block *block1 = [Block new];
        Block *block2 = [Block new];
        Block *block3 = [Block new];
        Block *block4 = [Block new];
        Block *block5 = [Block new];
        Block *block6 = [Block new];
        Block *block7 = [Block new];
        Block *block8 = [Block new];
        Block *block9 = [Block new];
        [block0 setInfo:2 :1 :2 :2];
        [block1 setInfo:2 :4 :2 :1];
        [block2 setInfo:1 :1 :1 :2];
        [block3 setInfo:4 :1 :1 :2];
        [block4 setInfo:1 :3 :1 :2];
        [block5 setInfo:4 :3 :1 :2];
        [block6 setInfo:1 :5 :1 :1];
        [block7 setInfo:2 :5 :1 :1];
        [block8 setInfo:3 :5 :1 :1];
        [block9 setInfo:4 :5 :1 :1];
        [block0 initLocation];
        [block1 initLocation];
        [block2 initLocation];
        [block3 initLocation];
        [block4 initLocation];
        [block5 initLocation];
        [block6 initLocation];
        [block7 initLocation];
        [block8 initLocation];
        [block9 initLocation];
        
        NSArray *blocks = [NSArray arrayWithObjects: block0, block1, block2, block3, block4, block5, block6, block7, block8, block9, nil];
        struct path mypath;
        
        printmap();
        
        procedure *procedures = [procedure new];
        int k = 0;
        bool isFounded = false;
        bool flag = false;
        
        while([blocks[0] locationX] != 2 || [blocks[0] locationY] != 5) {
            for (int dirI = 0; dirI <= 3 && !isFounded; dirI++) {
                for (int i = 0; i <= 9 && !isFounded; i++) {
                    switch(dirI) {
                        case 0: {
                            if([blocks[i] upMove]) {
                                [procedures writeTag:k :i];
                                [procedures writeDir:k :dirI];
                                NSLog(@"%i %i %i", [procedures tag: k], [procedures direction: k], [procedures returnSumSTeps]);
                                k++;
                                flag = true;
                            }
                            break;
                        }
                        case 1: {
                            if([blocks[i] downMove]) {
                                [procedures writeTag:k :i];
                                [procedures writeDir:k :dirI];
                                NSLog(@"%i %i", [procedures tag: k], [procedures direction: k]);
                                k++;
                                //flag = true;
                            }
                            break;
                        }
                        case 2: {
                            if([blocks[i] downMove]) {
                                [procedures writeTag:k :i];
                                [procedures writeDir:k :dirI];
                                NSLog(@"%i %i", [procedures tag: k], [procedures direction: k]);
                                k++;
                                flag = true;
                            }
                            break;
                        }
                        case 3: {
                            if([blocks[i] rightMove]) {
                                [procedures writeTag:k :i];
                                [procedures writeDir:k :dirI];
                                NSLog(@"%i %i", [procedures tag: k], [procedures direction: k]);
                                k++;
                                //flag = true;
                            }
                            break;
                        }
                    }
                    
                    
                    if([blocks[0] locationX] == 2 && [blocks[0] locationY] == 5) {
                        isFounded = true;
                        break;
                    }
                    
                    if (flag) {
                        flag = false;
                        continue;
                    }
                }
                if (isFounded) {
                    break;
                }
            }
        }
        
        for(int i = 0; i <= [procedures returnSumSTeps]; i++) {
            printf("%d %d", [procedures tag: i], [procedures direction: i]);
        }
        
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

void bfs() {
    
}

void printmap() {
    for(int i = 1; i <= 5; i++) {
        for(int j = 1; j <= 4; j++) {
            printf("%i", map[j][i]);
        }
        printf("\n");
    }
}
