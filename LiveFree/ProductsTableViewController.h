//
//  ProductsTableViewController.h
//  LiveFree
//
//  Created by Mayur Phadte on 02/01/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONHandler.h"

@interface ProductsTableViewController : UITableViewController<JSONHandlerDelegate>{
    NSMutableArray *imageArray, *nameArray, *sizeArray, *priceArray;
    BOOL loadBool;
}
@property NSString *category;
@property NSInteger pageIndex, productcount, categoryid;
@property NSNumber *count, *ids;

@end
