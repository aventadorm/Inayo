//
//  CartAPI.m
//  LiveFree
//
//  Created by Mayur Phadte on 01/02/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import "CartAPI.h"
#import "PersistencyManager.h"
@interface CartAPI () {
    PersistencyManager *persistencyManager;
    BOOL isOnline;
}

@end
@implementation CartAPI
- (id)init
{
    self = [super init];
    if (self) {
        persistencyManager = [[PersistencyManager alloc] init];
        isOnline = NO;
    }
    return self;
}

- (NSArray*)getCartObjects
{
    return [persistencyManager getCartObjects];
}

- (void)addCartObject:(CartObject *)cartobject atIndex:(int)index
{
    [persistencyManager addCartObject:cartobject atIndex:index];
    if (isOnline)
    {
        //[httpClient postRequest:@"/api/addAlbum" body:[album description]];
    }
}

- (void)deleteAlbumAtIndex:(int)index
{
    [persistencyManager deleteCartObjectAtIndex:index];
    if (isOnline)
    {
        //[httpClient postRequest:@"/api/deleteAlbum" body:[@(index) description]];
    }
}
+ (CartAPI*)sharedInstance{

    //1
    static CartAPI *_sharedInstance = nil;
    
    //2
    static dispatch_once_t oncePredicate;
    
    //3
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[CartAPI alloc]init];
    });
    return _sharedInstance;
}

@end
