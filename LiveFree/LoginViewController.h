//
//  LoginViewController.h
//  LiveFree
//
//  Created by Mayur Phadte on 27/08/15.
//  Copyright (c) 2015 Mayur Phadte. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JSONHandler.h"


@interface LoginViewController : UIViewController<JSONHandlerDelegate>{
    
        bool loginresult;
    
    JSONHandler* loginHandler ;
    }
- (IBAction)loginpressed:(id)sender;


@property (strong, nonatomic) IBOutlet UITextField *emailtf;
@property (strong, nonatomic) IBOutlet UITextField *passwordtf;

@end
