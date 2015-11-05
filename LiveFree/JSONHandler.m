//
//  JSONHandler.m
//  LiveFree
//
//  Created by Mayur Phadte on 28/08/15.
//  Copyright (c) 2015 Mayur Phadte. All rights reserved.
//

#import "JSONHandler.h"

@implementation JSONHandler
-(void)login:(NSString*)number withusernamepassword:(NSString*)password{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSDictionary *parameters = @{@"username": number};
        
    [manager POST:@"http://inayoapp.com/api/v1/user/mobile_login/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Response is a Dictionary");
            NSDictionary *responseDict = responseObject;
            [prefs setBool:[responseDict objectForKey:@"success"] forKey:@"isLoggedin"];
            [prefs setObject:[responseDict objectForKey:@"email"] forKey:@"email"];
            [prefs setObject:[responseDict objectForKey:@"fullname"] forKey:@"fullname"];
            [self.delegate loginSuccess];
        }else if ([responseObject isKindOfClass:[NSArray class]]) {
            NSLog(@"Response is an array");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", operation.responseString);
        [prefs setObject:@"" forKey:@"email"];
        [prefs setObject:@"" forKey:@"fullname"];
        [prefs setBool:false forKey:@"isLoggedin"];
        [self.delegate loginFailure];
    }];
    
    
    
   }
-(void)getstorecategories:(int)bid {
    __block NSMutableArray* categories = [[NSMutableArray alloc]init];
    NSMutableArray *ids = [[NSMutableArray alloc]init];
    NSMutableArray *names = [[NSMutableArray alloc]init];
    NSMutableArray *urls = [[NSMutableArray alloc]init];
    NSString *globalURL = @"http://inayoapp.com";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSDictionary *parameters = @{@"bid": [NSNumber numberWithInt:bid] };
    [manager POST:@"http://www.inayoapp.com/api/v1/store/store_categories/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);1
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *response = responseObject;
            categories = [response objectForKey:@"category"];
            for(int i = 0;i<categories.count;i++)
                {
                names[i]=[categories[i] objectForKey:@"name"];
                ids[i]=[categories[i] objectForKey:@"id"];
                urls[i]= [NSString stringWithFormat:@"%@%@",globalURL,[categories[i] objectForKey:@"image"]];
                }
            [self.delegate categoriesRetrieved:names :ids :urls];
            
        }else if ([responseObject isKindOfClass:[NSArray class]]) {
            
            NSLog(@"Response is an array");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", operation.responseString);
    }];
    
    
}

-(void)getstoreproducts:(int)bid :(int)cid {
    __block NSMutableArray* categories = [[NSMutableArray alloc]init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSDictionary *parameters = @{@"bid": [NSNumber numberWithInt:bid] , @"cid" : [NSNumber numberWithInt:cid]};
    [manager POST:@"http://www.inayoapp.com/api/v1/store/categories/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        //if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            
        //}else if ([responseObject isKindOfClass:[NSArray class]]) {
            
          //  NSLog(@"Response is an array");
        //}
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", operation.responseString);
    }];
    
    
}
@end



