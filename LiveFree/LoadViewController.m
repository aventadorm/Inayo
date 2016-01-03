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
NSMutableArray* controllerarray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",_ids);
    JSONHandler *producthandler = [[JSONHandler alloc]init];
    producthandler.delegate = self;
    [producthandler getstoresubcategories:1 :[_ids intValue]];
    
}
-(void)subcategoriesRetrieved:(NSMutableArray*)category :(NSMutableArray*)count :(NSMutableArray*)ids :(NSUInteger)number{
    //SubCategoryTableViewController *sctvc = [[SubCategoryTableViewController alloc]init];
     controllerarray = [[NSMutableArray alloc]init];
     for(int i=0 ; i<number; i++){
         ProductsTableViewController* ptvc = [[ProductsTableViewController alloc]init];
         ptvc.category = category[i];
         ptvc.count = count[i];
         ptvc.ids = ids[i];
         NSLog(@"%@",category);
         UIImage* anImage = NULL;
         //UIImage* anImage = [UIImage imageNamed:@"inayo.png"];
         UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:category[i] image:anImage tag:0];
         ptvc.tabBarItem = theItem;
         controllerarray[i] = ptvc;
         
         
     
        }
  //  [self presentViewController:tabbarcontroller animated:NO completion:nil];
    
     
     
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (ProductsTableViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    ProductsTableViewController *ptvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    ptvc.pageIndex = index;
    
    return ptvc;
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
