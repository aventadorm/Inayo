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
-(void) subcategoriesRetrieved:(NSMutableArray*)category :(NSMutableArray*)count :(NSMutableArray*)ids :(NSUInteger)number;
-(void) productsRetrieved:(NSMutableArray*)catid :(NSMutableArray*)desc :(NSMutableArray*)details :(NSMutableArray*)flavor :(NSMutableArray*)height :(NSMutableArray*)ids :(NSMutableArray*)image :(NSMutableArray*)item_is :(NSMutableArray*)medium_image :(NSMutableArray*)model :(NSMutableArray*)name :(NSMutableArray*)price :(NSMutableArray*)sale_price :(NSMutableArray*)size :(NSMutableArray*)small_image :(NSMutableArray*)weight :(NSMutableArray*)width;
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
-(void)getstoresubcategories:(int)bid :(int)cid;
-(void)getstoreproducts:(int)bid :(int)cid;

@end
