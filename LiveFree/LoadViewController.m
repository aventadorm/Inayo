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
     UITabBarController* tabbarcontroller = [[UITabBarController alloc]init];
     controllerarray = [[NSMutableArray alloc]init];
     for(int i=0 ; i<number; i++){
         ProductsTableViewController* ptvc = [[ProductsTableViewController alloc]init];
         UIImage* anImage = NULL;
         //UIImage* anImage = [UIImage imageNamed:@"inayo.png"];
         UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:anImage tag:0];
         ptvc.tabBarItem = theItem;
         controllerarray[i] = ptvc;
         
         
     
         //create viewcontrollers and add to array
         //add tabbaritem to viewcontroller
        }
     tabbarcontroller.viewControllers = controllerarray;
    [self presentModalViewController:tabbarcontroller animated:YES];
    
     
     
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
