//
//  PersistencyManager.m
//  LiveFree
//
//  Created by Mayur Phadte on 01/02/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import "PersistencyManager.h"
@interface PersistencyManager(){
//an array of all CartObjects
    NSMutableArray *cartObjects;
}
@end
@implementation PersistencyManager
- (NSArray*)getCartObjects
{
    return cartObjects;
}

- (void)addCartObject:(CartObject *)cartobject atIndex:(int)index
{
    if (cartObjects.count >= index)
        [cartObjects insertObject:cartobject atIndex:index];
    else
        [cartObjects addObject:cartobject];
}

- (void)deleteCartObjectAtIndex:(int)index
{
    [cartObjects removeObjectAtIndex:index];
}
@end
