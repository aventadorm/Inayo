//
//  LoginViewController.m
//  LiveFree
//
//  Created by Mayur Phadte on 27/08/15.
//  Copyright (c) 2015 Mayur Phadte. All rights reserved.
//




#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize emailtf,passwordtf;
- (void)viewDidLoad {
    [super viewDidLoad];
    loginHandler = [[JSONHandler alloc] init];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginpressed:(id)sender {
    
    
    NSString* email = emailtf.text;
    NSString* password = passwordtf.text;
    loginHandler.delegate = self;
    [loginHandler login:email withusernamepassword:password];
    
    /*[loginHandler login:email withusernamepassword:password WithCompletionHandler:^(BOOL loginresult1){
        if(loginresult1){
            NSLog(@"Login successful, opening main screen");
            [self performSegueWithIdentifier:@"logindone" sender:nil];
            
        }
        else NSLog(@"Login unsuccessful");
    
    }];*/
}
#pragma mark - JSON Handler delegate
-(void)loginSuccess{
    NSLog(@"Success");
    [self performSegueWithIdentifier:@"loginDone" sender:nil];
}

-(void)loginFailure{
    NSLog(@"Failure");
}
@end