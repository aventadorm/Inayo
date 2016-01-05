//
//  CollectionViewController.m
//  LiveFree
//
//  Created by Mayur Phadte on 28/09/15.
//  Copyright © 2015 Mayur Phadte. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "LoadViewController.h"
@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    imageArray = [[NSMutableArray alloc]init];
    nameArray = [[NSMutableArray alloc]init];
    idArray = [[NSMutableArray alloc]init];
    loadBool = false;
    JSONHandler *categoriesHandler = [[JSONHandler alloc]init];
    categoriesHandler.delegate = self;
    [categoriesHandler getstorecategories:1];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) categoriesRetrieved:(NSMutableArray*)names :(NSMutableArray*)ids :(NSMutableArray*)urls{
    idArray = ids;
    nameArray = names;
    itemcount = (int)urls.count;
    //NSLog(@"%@",idArray);
    //NSLog(@"%@",urls);
    //NSLog(@"%d",itemcount);
    int i = 0;
    for(i = 0;i < urls.count;i++){
        imageArray[i]=[NSNull null];
    }
    __block int imagecounter = 0;
    for(i = 0;i < urls.count;i++){
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urls[i]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        imageArray[i] = [UIImage imageWithData:data];
        imagecounter++;
        if(imagecounter == urls.count){
            loadBool = true;
            [self.collectionView reloadData];
        }
    }];
    }
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return itemcount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if(loadBool){
        cell.tlabel.text = nameArray[indexPath.row];
        cell.tlabel.textAlignment = NSTextAlignmentCenter;
        //NSLog(@"%@",cell.tlabel.text);
        cell.imageView.image = imageArray[indexPath.row];
        }
    else
        return cell;
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //return CGSizeMake(300,300);
    return CGSizeMake(collectionView.bounds.size.width/2, collectionView.bounds.size.width/2);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"catSelect"])
    {
        NSIndexPath *selectedIndexPath = [self.collectionView indexPathsForSelectedItems][0];
        NSString *ids = idArray[selectedIndexPath.row];
        //NSLog(@"%@",ids);
        
        LoadViewController* loadviewcontroller = segue.destinationViewController;
        loadviewcontroller.ids = ids;
        
        
    }
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
