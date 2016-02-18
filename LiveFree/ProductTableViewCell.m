//
//  ProductTableViewCell.m
//  LiveFree
//
//  Created by Mayur Phadte on 03/01/16.
//  Copyright © 2016 Mayur Phadte. All rights reserved.
//

#import "ProductTableViewCell.h"

@implementation ProductTableViewCell

- (void)awakeFromNib {
    // Initialization code
    CGRect tmpFrame;
    _label1 = [[UILabel alloc]initWithFrame:tmpFrame];
    [self addSubview:_label1];
    
    _label2 = [[UILabel alloc]initWithFrame:tmpFrame];
    [self addSubview:_label2];
    
    _label3 = [[UILabel alloc]initWithFrame:tmpFrame];
    [self addSubview:_label3];
    
    _plus = [[UIButton alloc]initWithFrame:tmpFrame];
    UIImage *pImage = [UIImage imageNamed:@"plus.png"];
    [_plus setImage:pImage forState:UIControlStateNormal];
    //_plus.imageView.image=[UIImage imageNamed:@"plus.png"];
    [self addSubview:_plus];
    
    _qLabel = [[UILabel alloc]initWithFrame:tmpFrame];
    [self addSubview:_qLabel];
    
    _minus =[[UIButton alloc]initWithFrame:tmpFrame];
    UIImage *mImage = [UIImage imageNamed:@"minus.png"];
    [_minus setImage:mImage forState:UIControlStateNormal];
    [self addSubview:_minus];
    
    //_minus = [[UIButton alloc]initWithFrame:tmpFrame];
    //[self addSubview:_minus];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //Init code
    UITableView *parentTV = [self parentTableView];
    CGFloat cellWidth = parentTV.bounds.size.width;
    CGFloat cellHeight = parentTV.bounds.size.width/4;
    CGFloat pad = 3.0;
    CGFloat labelHeight = (cellHeight - 4*pad)/3;
    CGRect tmpFrame ;
    
    //parentTV.translatesAutoresizingMaskIntoConstraints = YES;
    
    //Obtain the cell dimensions from parent table view
    self.imageView.bounds = CGRectMake(0,0,cellWidth/4,cellHeight);
    self.imageView.frame = CGRectMake(0,0,cellWidth/4,cellHeight);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    
    
    //Create the first label frame
    tmpFrame.origin.x = cellHeight + pad;
    tmpFrame.origin.y = pad;
    tmpFrame.size.width = (3*cellHeight) - (2*pad);
    tmpFrame.size.height = labelHeight + pad;
    _label1.frame = tmpFrame;
    _label1.text = self.titleText;
    
    
    //Create the second label frame
    tmpFrame.origin.x = cellHeight + pad;
    tmpFrame.origin.y = 2*pad + labelHeight;
    tmpFrame.size.width = (3*cellHeight) - (2*pad);
    tmpFrame.size.height = labelHeight + pad;
    _label2.frame = tmpFrame;
    _label2.text= self.quantityText;
    
    //Create the third label frame
    tmpFrame.origin.x = cellHeight + pad;
    tmpFrame.origin.y = 3*pad + (2*labelHeight);
    tmpFrame.size.width = ((3*cellHeight) - (2*pad))/2;
    tmpFrame.size.height = labelHeight + pad;
    _label3.frame = tmpFrame;
    _label3.text= self.priceText;
    
    
    //Layout the two cart buttons
    tmpFrame.origin.x = pad + (5*cellHeight)/2;
    tmpFrame.origin.y = 3*pad + (2*labelHeight);
    tmpFrame.size.width = labelHeight + pad;
    //tmpFrame.size.width = ((3*cellHeight) - (2*pad))/4;
    tmpFrame.size.height = labelHeight + pad;
    _plus.frame = tmpFrame;
    
    //Set the label
    tmpFrame.origin.x = 2*pad + (5*cellHeight)/2+labelHeight;
    tmpFrame.origin.y = 3*pad + (2*labelHeight);
    tmpFrame.size.width = labelHeight + pad;
    tmpFrame.size.height = labelHeight + pad;
    _qLabel.frame = tmpFrame;
    
    
    tmpFrame.origin.x = 3*pad + 2*labelHeight + (5*cellHeight)/2;
    tmpFrame.origin.y = 3*pad + (2*labelHeight);
    tmpFrame.size.width = labelHeight + pad;
    tmpFrame.size.height = labelHeight + pad;
    _minus.frame = tmpFrame;
    
}




//Function to obtain parent table view with a class check
-(UITableView *) parentTableView {
    // iterate up the view hierarchy to find the table containing this cell/view
    UIView *aView = self.superview;
    while(aView != nil) {
        if([aView isKindOfClass:[UITableView class]]) {
            return (UITableView *)aView;
        }
        aView = aView.superview;
    }
    return nil; // this view is not within a tableView
}

@end
