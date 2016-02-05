//
//  CartAPI.h
//  LiveFree
//
//  Created by Mayur Phadte on 01/02/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartObject.h"

@interface CartAPI : NSObject
-(NSArray*) getCartObjects;
-(void)addCartObject:(CartObject*)cartobject atIndex:(int)index;
-(void)deleteCartObjectAtIndex:(int)index;
+ (CartAPI*)sharedInstance;

@end
