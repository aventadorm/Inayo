//
//  JSONHandler.h
//  LiveFree
//
//  Created by Mayur Phadte on 28/08/15.
//  Copyright (c) 2015 Mayur Phadte. All rights reserved.
//

#import <Foundation/Foundation.h>

#import<AFHTTPRequestOperationManager.h>
// Protocol definition starts here
@protocol JSONHandlerDelegate <NSObject>
-(void) loginSuccess;
-(void) loginFailure;
-(void) categoriesRetrieved:(NSMutableArray*)names :(NSMutableArray*)ids :(NSMutableArray*)urls;
@end
// Protocol Definition ends here

@interface JSONHandler : NSObject
{
    // Delegate to respond back
    id <JSONHandlerDelegate> _delegate;
    
}
@property (nonatomic,strong) id delegate;
-(void)login:(NSString*)number withusernamepassword:(NSString*)password;
-(void)signup:(NSString*)name :(NSString*)mobile :(NSString*)email :(NSString*)password;
-(void)getstorecategories:(int)bid;
-(void)getstoreproducts:(int)bid :(int)cid;

@end
