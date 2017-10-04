//
//  FirstScreenViewController.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "FirstScreenViewController.h"
#import "LoginScreenViewController.h"
#import "SignUpViewController.h"

@interface FirstScreenViewController ()

@end

@implementation FirstScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inscriptionPage:(id)sender {
    SignUpViewController* signUpVc = [[SignUpViewController alloc] init];
    [self.navigationController pushViewController:signUpVc animated:YES];
}

- (IBAction)connectionPage:(id)sender {
    LoginScreenViewController* loginVc = [[LoginScreenViewController alloc] init];
    [self.navigationController pushViewController:loginVc animated:YES];
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
