//
//  JSONHandler.m
//  LiveFree
//
//  Created by Mayur Phadte on 28/08/15.
//  Copyright (c) 2015 Mayur Phadte. All rights reserved.
//

#import "JSONHandler.h"

@implementation JSONHandler

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
    NSDictionary *parameters = @{@"bid": [NSNumber numberWithInt:bid],@"versionCode": [NSNumber numberWithInt:29] };
    [manager POST:@"http://www.inayoapp.com/api/v1/store/store_categories/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *response = responseObject;
            categories = [response objectForKey:@"category"];
            for(int i = 0;i<categories.count;i++)
                {
                names[i]=[categories[i] objectForKey:@"name"];
                ids[i]=[categories[i] objectForKey:@"id"];
                urls[i] = [NSString stringWithFormat:@"%@%@",globalURL,[categories[i] objectForKey:@"image"]];
                }
            [self.delegate categoriesRetrieved:names :ids :urls];
            
        }else if ([responseObject isKindOfClass:[NSArray class]]) {
            
            NSLog(@"Response is an array");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", operation.responseString);
    }];
    
    
}

-(void)getstoresubcategories:(int)bid :(int)cid {
    __block NSMutableArray* products = [[NSMutableArray alloc]init];
    NSMutableArray *category = [[NSMutableArray alloc]init];
    NSMutableArray *count = [[NSMutableArray alloc]init];
    NSMutableArray *ids = [[NSMutableArray alloc]init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSDictionary *parameters = @{@"bid": [NSNumber numberWithInt:bid] , @"cid" : [NSNumber numberWithInt:cid]};
    [manager POST:@"http://www.inayoapp.com/api/v1/store/categories/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *response = responseObject;
            products = [response objectForKey:@"category"];
            for(int i = 0;i<products.count;i++)
            {
                category[i]=[products[i] objectForKey:@"category"];
                count[i]=[products[i] objectForKey:@"count"];
                ids[i]=[products[i] objectForKey:@"id"];
            }
            [self.delegate subcategoriesRetrieved:category :count :ids :products.count];
            //NSLog(@"%@", category);
        }else if ([responseObject isKindOfClass:[NSArray class]]) {
            
            NSLog(@"Response is an array");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", operation.responseString);
    }];
}
-(void)getstoreproducts:(int)cid{
    __block NSMutableArray* products = [[NSMutableArray alloc]init];
    NSString *globalmediaURL = @"http://inayoapp.com/media/";
    NSMutableArray *catid = [[NSMutableArray alloc]init];
    NSMutableArray *desc = [[NSMutableArray alloc]init];
    NSMutableArray *details = [[NSMutableArray alloc]init];
    NSMutableArray *flavor = [[NSMutableArray alloc]init];
    NSMutableArray *height = [[NSMutableArray alloc]init];
    NSMutableArray *ids = [[NSMutableArray alloc]init];
    NSMutableArray *image = [[NSMutableArray alloc]init];
    NSMutableArray *item_is = [[NSMutableArray alloc]init];
    NSMutableArray *medium_image = [[NSMutableArray alloc]init];
    NSMutableArray *model = [[NSMutableArray alloc]init];
    NSMutableArray *name = [[NSMutableArray alloc]init];
    NSMutableArray *price = [[NSMutableArray alloc]init];
    NSMutableArray *sale_price = [[NSMutableArray alloc]init];
    NSMutableArray *size = [[NSMutableArray alloc]init];
    NSMutableArray *small_image = [[NSMutableArray alloc]init];
    NSMutableArray *weight = [[NSMutableArray alloc]init];
    NSMutableArray *width = [[NSMutableArray alloc]init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSDictionary *parameters = @{@"cid" : [NSNumber numberWithInt:cid]};
    [manager POST:@"http://www.inayoapp.com/api/v1/store/products/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *response = responseObject;
            products = [response objectForKey:@"category"];
            //NSLog(@"%@",products);
            for(int i = 0;i < products.count;i++)
            {
                //NSLog(@"Entered here");
                catid[i]=[products[i] objectForKey:@"catid"];
                desc[i]=[products[i] objectForKey:@"desc"];
                details[i]=[products[i] objectForKey:@"details"];
                flavor[i]=[products[i] objectForKey:@"flavor"];
                height[i]=[products[i] objectForKey:@"height"];
                ids[i]=[products[i] objectForKey:@"id"];
                item_is[i]=[products[i] objectForKey:@"item_is"];
                model[i]=[products[i] objectForKey:@"model"];
                name[i]=[products[i] objectForKey:@"name"];
                price[i]=[products[i] objectForKey:@"price"];
                sale_price[i]=[products[i] objectForKey:@"sale_price"];
                size[i]=[products[i] objectForKey:@"size"];
                weight[i]=[products[i] objectForKey:@"weight"];
                width[i]=[products[i] objectForKey:@"width"];
                //URL manipulation
                image[i] = [[NSString stringWithFormat:@"%@%@",globalmediaURL,[products[i] objectForKey:@"image"]] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
                medium_image[i] = [[NSString stringWithFormat:@"%@%@",globalmediaURL,[products[i] objectForKey:@"medium_image"]] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
                small_image[i] = [[NSString stringWithFormat:@"%@%@",globalmediaURL,[products[i] objectForKey:@"small_image"]] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
                
               }
            [self.delegate productsRetrieved:catid :desc :details :flavor :height :ids :image :item_is :medium_image :model :name :price :sale_price :size :small_image :weight :width];
        }else if ([responseObject isKindOfClass:[NSArray class]]) {
            
            NSLog(@"Response is an array");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", operation.responseString);
    }];
}

@end



