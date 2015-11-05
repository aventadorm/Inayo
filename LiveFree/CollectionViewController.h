//
//  CollectionViewController.h
//  LiveFree
//
//  Created by Mayur Phadte on 28/09/15.
//  Copyright © 2015 Mayur Phadte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONHandler.h"

@interface CollectionViewController : UICollectionViewController<JSONHandlerDelegate>{
    int itemcount;
    NSMutableArray *imageArray, *nameArray, *idArray;
    BOOL loadBool;
}

@end
