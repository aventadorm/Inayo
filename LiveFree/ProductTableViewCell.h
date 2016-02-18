//
//  ProductTableViewCell.h
//  LiveFree
//
//  Created by Mayur Phadte on 03/01/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property NSString *titleText, *quantityText, *priceText;
@property (strong, nonatomic) UILabel *label1, *label2, *label3,*qLabel;
@property(strong,nonatomic) UIButton *plus, *minus;

@end
