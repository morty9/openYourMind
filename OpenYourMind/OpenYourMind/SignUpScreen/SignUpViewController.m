//
//  SignUpViewController.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self designPage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) designPage {
    
    //navigation bar customisation
    self.navigationItem.title = [NSString stringWithFormat:@"S'inscrire"];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.14 green:0.22 blue:0.27 alpha:1.0];
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:0.14 green:0.22 blue:0.27 alpha:1.0] forKey:NSForegroundColorAttributeName];
    
    
    //border email text field
    CALayer *borderEmail = [CALayer layer];
    CGFloat borderWidthEmail = 1.5;
    borderEmail.borderColor = [UIColor darkGrayColor].CGColor;
    borderEmail.frame = CGRectMake(0, email.frame.size.height - borderWidthEmail, email.frame.size.width, email.frame.size.height);
    borderEmail.borderWidth = borderWidthEmail;
    [email.layer addSublayer:borderEmail];
    email.layer.masksToBounds = YES;
    
    //border password text field
    CALayer *borderPwd = [CALayer layer];
    CGFloat borderWidthPwd = 1.5;
    borderPwd.borderColor = [UIColor darkGrayColor].CGColor;
    borderPwd.frame = CGRectMake(0, password.frame.size.height - borderWidthPwd, password.frame.size.width, password.frame.size.height);
    borderPwd.borderWidth = borderWidthPwd;
    [password.layer addSublayer:borderPwd];
    password.layer.masksToBounds = YES;
    
    //border name text field
    CALayer *borderLastname = [CALayer layer];
    CGFloat borderWidthLastname = 1.5;
    borderLastname.borderColor = [UIColor darkGrayColor].CGColor;
    borderLastname.frame = CGRectMake(0, name.frame.size.height - borderWidthLastname, name.frame.size.width, name.frame.size.height);
    borderLastname.borderWidth = borderWidthLastname;
    [name.layer addSublayer:borderLastname];
    name.layer.masksToBounds = YES;
    
    //border firstname text field
    CALayer *borderFirstname = [CALayer layer];
    CGFloat borderWidthFirstname = 1.5;
    borderFirstname.borderColor = [UIColor darkGrayColor].CGColor;
    borderFirstname.frame = CGRectMake(0, firstname.frame.size.height - borderWidthFirstname, firstname.frame.size.width, firstname.frame.size.height);
    borderFirstname.borderWidth = borderWidthFirstname;
    [firstname.layer addSublayer:borderFirstname];
    firstname.layer.masksToBounds = YES;
    
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
