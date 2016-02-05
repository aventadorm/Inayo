//
//  CartObject.h
//  LiveFree
//
//  Created by Mayur Phadte on 01/02/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CartObject : NSObject
@property(nonatomic, copy, readonly) NSString *catid, *index;
-(id)initWithTitle:(NSString*)catid :(NSString*)index;
@end
