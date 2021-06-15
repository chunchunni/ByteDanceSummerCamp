//
//  Fraction.m
//  study
//
//  Created by Admin on 2021/6/13.
//

#import "Segment_Tree.h"

@implementation Segment_Tree

const int MAXN = 1000000;
int a[MAXN], lazy[MAXN];

-(void) push_up: (int) rt
{
    a[rt] = a[rt << 1] + a[rt << 1 | 1];
}

-(void) push_down: (int) rt : (int) num
{
    if(lazy[rt])
    {
        lazy[rt << 1] += lazy[rt];
        lazy[rt << 1 | 1] += lazy[rt];
        a[rt << 1] += lazy[rt] * (num - (num >> 1));
        a[rt << 1 | 1] += lazy[rt] * (num >> 1);
        lazy[rt] = 0;
    }
}

-(void) build: (int) rt : (int) l : (int) r
{
    lazy[rt] = 0;
    if(l == r)
    {
        scanf("%d", &a[rt]);
        return ;
    }
    int mid = (l + r) >> 1;
    [self build: rt << 1 : l : mid];
    [self build: rt << 1 | 1 : mid + 1 : r];
    [self push_up: rt];
}

-(void) update: (int) rt : (int) l : (int) r : (int) L : (int) R : (int) val
{
    if(L <= l && r <= R)
    {
        a[rt] += (r - l + 1) * val;
        lazy[rt] += val;
        return ;
    }
    [self push_down: rt : r - l + 1];
    int mid = (l + r) >> 1;
    if(L <= mid) [self update: rt << 1 : l : mid : L : R : val];
    if(R > mid) [self update: rt << 1 | 1 : mid + 1 : r : L : R : val];
    [self push_up: rt];
}

-(int) query: (int) rt : (int) l : (int) r : (int) L : (int) R
{
    if(L <= l && r <= R) return a[rt];
    [self push_down: rt : r - l + 1];
    int mid = (l + r) >> 1, res = 0;
    if(L <= mid) res += [self query: rt << 1 : l : mid : L : R];
    if(R > mid) res += [self query: rt << 1 | 1 : mid + 1 : r : L : R];
    return res;
}

@end

