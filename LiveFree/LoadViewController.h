//
//  LoadViewController.h
//  LiveFree
//
//  Created by Mayur Phadte on 03/01/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductsTableViewController.h"

@interface LoadViewController : UIViewController <UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles, *pageCounts, *pageIDs;
@property NSString *ids;
@end
