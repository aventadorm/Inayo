//
//  trialViewController.m
//  LiveFree
//
//  Created by Mayur Phadte on 27/09/15.
//  Copyright © 2015 Mayur Phadte. All rights reserved.
//

#import "trialViewController.h"
#import "JSONHandler.h"

@interface trialViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation trialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    JSONHandler *trialHandler = [[JSONHandler alloc]init];
    trialHandler.delegate = self;
    [trialHandler getstorecategories:1];
}

-(void) categoriesRetrieved:(NSMutableArray*)names :(NSMutableArray*)ids :(NSMutableArray*)urls{
    
    
    //[NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urls[i]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
    //imageData[i]=data;
    //[self.collectionView reloadData];
    //}];
    NSLog(@"%@",ids);
    NSLog(@"%@",names);
    
    //NSLog(@"%@",imageData);
    
    
    //};
}
@end

