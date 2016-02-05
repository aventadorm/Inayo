//
//  ProductsTableViewController.h
//  LiveFree
//
//  Created by Mayur Phadte on 02/01/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONHandler.h"
#import "MBProgressHUD.h"

@interface ProductsTableViewController : UITableViewController<JSONHandlerDelegate,MBProgressHUDDelegate>{
    NSMutableArray *imageArray, *nameArray, *sizeArray, *priceArray;
    MBProgressHUD *HUD;
    BOOL loadBool;
}
@property UINavigationItem *navigationItem;
@property NSString *category;
@property NSInteger pageIndex, productcount, categoryid;
@property NSNumber *count, *ids;

@end
