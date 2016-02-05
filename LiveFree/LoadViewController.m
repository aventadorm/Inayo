//
//  LoadViewController.m
//  LiveFree
//
//  Created by Mayur Phadte on 03/01/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import "LoadViewController.h"
#import "JSONHandler.h"
#import "ProductsTableViewController.h"

@interface LoadViewController ()

@end

@implementation LoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //NSLog(@"%@",_ids);
    JSONHandler *producthandler = [[JSONHandler alloc]init];
    producthandler.delegate = self;
    [producthandler getstoresubcategories:1 :[self.ids intValue]];
}


-(void)subcategoriesRetrieved:(NSMutableArray*)category :(NSMutableArray*)count :(NSMutableArray*)ids :(NSUInteger)number{
    //Setting array of each category name, product count and category ID
    _pageTitles = category;
    _pageCounts = count;
    _pageIDs = ids;
    //NSLog(@"%@",self.pageTitles);
    //NSLog(@"%@",self.pageIDs);
    
    
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    
    //Create the first controller and add to array
    ProductsTableViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewcontrollers = @[startingViewController];
    [self.pageViewController setViewControllers:viewcontrollers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    //Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
   
         
         
     
}
- (ProductsTableViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    ProductsTableViewController *productsTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    productsTableViewController.category = self.pageTitles[index];
    //NSLog(@"%@",self.pageTitles[index]);
    //NSLog(@"%@",self.pageIDs[index]);
    //NSLog(@"%lu",(unsigned long)index);
    productsTableViewController.categoryid = [self.pageIDs[index]integerValue];
    NSLog(@"%@",self.pageIDs);
    NSLog(@"cat id previously is %ld", (long)productsTableViewController.categoryid);
    productsTableViewController.pageIndex = index;
    productsTableViewController.navigationItem = self.navigationItem;
    
    
    
    return productsTableViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ProductsTableViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ProductsTableViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
