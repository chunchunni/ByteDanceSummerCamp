//
//  main.m
//  study
//
//  Created by Admin on 2021/6/12.
//

#import "Segment_Tree.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Segment_Tree* tree = [Segment_Tree new];
        int n, Q;
        scanf("%d", &n); // 输入线段树数据节点数
        [tree build: 1 : 1 : n]; // 建立线段树
        scanf("%d", &Q); // 输入操作个数
        while(Q--)
        {
            int a, b, c, d;
            scanf("%d", &a); // 读取单个操作类型
            switch(a)
            {
                case 1: // 修改操作
                    scanf("%d%d%d", &b, &c, &d); // [b, c]节点的值均增加d
                    [tree update: 1 : 1 : n : b : c : d]; // 执行update
                    break;
                case 2: // 读取操作
                    scanf("%d%d", &b, &c); // 读取[b, c]节点值的和
                    printf("%d\n",[tree query: 1 : 1 : n : b : c]); // 执行query
                    break;
                default:
                    printf("illegal input!\n");
            }
        }
    }
    return 0;
}
