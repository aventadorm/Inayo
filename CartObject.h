//
//  CartObject.h
//  LiveFree
//
//  Created by Mayur Phadte on 01/02/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CartObject : NSObject<NSCoding> {
NSString *value;
}
@property NSInteger catid, index, quantity;
-(id)init;
//-(id)initWithTitle:(NSString*)catid :(NSString*)index;
@end
