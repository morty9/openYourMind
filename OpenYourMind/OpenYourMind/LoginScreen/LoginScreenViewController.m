//
//  LoginScreenViewController.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "LoginScreenViewController.h"
#import "AssosiationViewController.h"
#import "crudAuth.h"

@interface LoginScreenViewController ()

@end

@implementation LoginScreenViewController {
    
    crudAuth* Auth;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self designPage];
    Auth = [[crudAuth alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToAssosiationsScreen:(id)sender {
    
    [Auth login:email.text password:password.text callback:^(NSError *error, BOOL success) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (success) {
                if ([Auth.dict_error valueForKey:@"type"] != nil) {
                    NSLog(@"ERROR CONNECTION");
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        AssosiationViewController* associationsVc = [[AssosiationViewController alloc] init];
                        [self.navigationController pushViewController:associationsVc animated:YES];
                    });
                }
            }
            
        });
        
    }];
}


- (void) designPage {
    
    //navigation bar customization
    self.navigationItem.title = [NSString stringWithFormat:@"Connexion"];
    
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
