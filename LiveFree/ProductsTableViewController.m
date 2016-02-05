//
//  ProductsTableViewController.m
//  LiveFree
//
//  Created by Mayur Phadte on 02/01/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import "ProductsTableViewController.h"
#import "JSONHandler.h"
#import "ProductTableViewCell.h"

@interface ProductsTableViewController ()

@end

@implementation ProductsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *bagimage = [[UIImage imageNamed:@"bag_icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightbutton = [[UIBarButtonItem alloc] initWithImage:bagimage style:UIBarButtonItemStylePlain target:self action:@selector(CartIcon)];
    self.navigationItem.rightBarButtonItem = rightbutton;
    //self.navigationItem.title.
    imageArray = [[NSMutableArray alloc]init];
    nameArray = [[NSMutableArray alloc]init];
    priceArray = [[NSMutableArray alloc]init];
    sizeArray = [[NSMutableArray alloc]init];
    loadBool = false;
    
    //Progress Indicator
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    // Set determinate mode
    HUD.mode = MBProgressHUDModeAnnularDeterminate;
    HUD.delegate = self;
    HUD.labelText = @"Loading products";
    [HUD show:YES];
    
    self.productcount = 0;
    JSONHandler *productHandler = [[JSONHandler alloc]init];
    productHandler.delegate = self;
    NSLog(@"catid is %ld",(long)self.categoryid);
    [productHandler getstoreproducts :self.categoryid];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //NSLog(@"%d",(int)self.productcount);
    //NSLog(@"%d",(int)self.categoryid);
    //NSLog(@"%@",self.category);
}

-(void)viewDidAppear:(BOOL)animated
{
    
    UIBarButtonItem *newButton = [[UIBarButtonItem alloc]
                                  initWithTitle:@"Whatever" style:UIBarButtonItemStylePlain target:self action:@selector(doSomething)];
    self.navigationItem.title = self.category;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) productsRetrieved:(NSMutableArray*)catid :(NSMutableArray*)desc :(NSMutableArray*)details :(NSMutableArray*)flavor :(NSMutableArray*)height :(NSMutableArray*)ids :(NSMutableArray*)image :(NSMutableArray*)item_is :(NSMutableArray*)medium_image :(NSMutableArray*)model :(NSMutableArray*)name :(NSMutableArray*)price :(NSMutableArray*)sale_price :(NSMutableArray*)size :(NSMutableArray*)small_image :(NSMutableArray*)weight :(NSMutableArray*)width {
    nameArray = name;
    priceArray = price;
    sizeArray = size;
    NSLog(@"%@",small_image);
    int i = 0;
    for(i = 0;i < image.count;i++){
        imageArray[i]=[NSNull null];
    }
    __block int imagecounter = 0;
    //NSLog(small_image);
    for(i = 0;i < small_image.count;i++){
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:small_image[i]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            NSLog(@"%d",i);
            imageArray[i] = [UIImage imageWithData:data];
            imagecounter++;
            //Calculate percentage completion
            float progress = 0.0f;
            progress = (float)imagecounter/(float)image.count;
            NSLog(@"Progress is %f",progress);
            HUD.progress = progress;
            
            
            if(imagecounter == image.count){
                HUD.progress=1.0f;
                [HUD hide:YES];
                loadBool = true;
                self.productcount = image.count;
                [self.tableView reloadData];
            }
        }];
    }

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.productcount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == 1) {
        return tableView.bounds.size.width/4;
    }
    else
        return tableView.bounds.size.width/4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tCell" forIndexPath:indexPath];
    //tableView.estimatedRowHeight = 100;
    //tableView.rowHeight = UITableViewAutomaticDimension;
    if(loadBool){
        cell.titleText = nameArray[indexPath.row];
        cell.quantityText = sizeArray[indexPath.row];
        cell.priceText = priceArray[indexPath.row];
        //NSLog(@"%@",cell.tlabel.text);
        cell.imageView.image = imageArray[indexPath.row];
    }
    else
        return cell;
    
    return cell;
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
