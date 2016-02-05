//
//  CartObject.m
//  LiveFree
//
//  Created by Mayur Phadte on 01/02/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import "CartObject.h"

@implementation CartObject
-(id)initWithTitle:(NSString *)catid :(NSString *)index{
    self = [super init];
    if(self)
    {
        _catid = catid;
        _index = index;
    }
    
    return self;
}
@end
