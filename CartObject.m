//
//  CartObject.m
//  LiveFree
//
//  Created by Mayur Phadte on 01/02/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import "CartObject.h"

@implementation CartObject
-(id)init{
    self = [super init];
    if(self){
        self.quantity = 0;
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInteger:self.catid forKey:@"catid"];
    [encoder encodeInteger:self.index forKey:@"index"];
    [encoder encodeInteger:self.quantity forKey:@"quantity"];
}
/*- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.password forKey:@"password"];
}
 
 - (id)initWithCoder:(NSCoder *)aDecoder
 {
 if (self = [super init]) {
 self.name = [aDecoder decodeObjectForKey:@"name"];
 self.age = [aDecoder decodeIntForKey:@"age"];
 self.email = [aDecoder decodeObjectForKey:@"email"];
 self.password = [aDecoder decodeObjectForKey:@"password"];
 }
 return self;
 }
 
*/
-(id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.catid =[decoder decodeIntegerForKey:@"catid"];
        self.index = [decoder decodeIntegerForKey:@"index"];
        self.quantity = [decoder decodeIntegerForKey:@"quantity"];
    }
    return self;
}


/*-(id)initWithTitle:(NSString *)catid :(NSString *)index{
    self = [super init];
    if(self)
    {
        _catid = catid;
        _index = index;
    }
    
    return self;
}*/
@end
