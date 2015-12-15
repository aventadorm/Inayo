//
//  TabViewController.m
//  LiveFree
//
//  Created by Mayur Phadte on 02/11/15.
//  Copyright © 2015 Mayur Phadte. All rights reserved.
//

#import "TabViewController.h"

@interface TabViewController ()

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",_ids);
    JSONHandler *producthandler = [[JSONHandler alloc]init];
    [producthandler getstoresubcategories:1 :[_ids intValue]];
}
-(void)subcategoriesRetrieved:(NSMutableArray*)category :(NSMutableArray*)count :(NSMutableArray*)ids{
    
    
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
