//
//  ProfilScreenViewController.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "ProfilScreenViewController.h"

@interface ProfilScreenViewController ()

@end

@implementation ProfilScreenViewController

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
    
    self.navigationItem.title = [NSString stringWithFormat:@"Profil"];
    
    //image profil
//    imageProfil.layer.cornerRadius = imageProfil.frame.size.width / 2;
//    imageProfil.clipsToBounds = YES;
    
    //border name text field
    CALayer *borderName = [CALayer layer];
    CGFloat borderWidthName = 1;
    borderName.borderColor = [UIColor darkGrayColor].CGColor;
    borderName.frame = CGRectMake(0, lastname.frame.size.height - borderWidthName, lastname.frame.size.width, lastname.frame.size.height);
    borderName.borderWidth = borderWidthName;
    [lastname.layer addSublayer:borderName];
    lastname.layer.masksToBounds = YES;
    
    //border nickname text field
    CALayer *borderFirstname = [CALayer layer];
    CGFloat borderWidthFirstname = 1;
    borderFirstname.borderColor = [UIColor darkGrayColor].CGColor;
    borderFirstname.frame = CGRectMake(0, firstname.frame.size.height - borderWidthFirstname, firstname.frame.size.width, firstname.frame.size.height);
    borderFirstname.borderWidth = borderWidthFirstname;
    [firstname.layer addSublayer:borderFirstname];
    firstname.layer.masksToBounds = YES;
    
    //border email text field
    CALayer *borderEmail = [CALayer layer];
    CGFloat borderWidthEmail = 1;
    borderEmail.borderColor = [UIColor darkGrayColor].CGColor;
    borderEmail.frame = CGRectMake(0, email.frame.size.height - borderWidthEmail, email.frame.size.width, email.frame.size.height);
    borderEmail.borderWidth = borderWidthEmail;
    [email.layer addSublayer:borderEmail];
    email.layer.masksToBounds = YES;
    
    //border password text field
    CALayer *borderPassword = [CALayer layer];
    CGFloat borderWidthPassword = 1;
    borderPassword.borderColor = [UIColor darkGrayColor].CGColor;
    borderPassword.frame = CGRectMake(0, password.frame.size.height - borderWidthPassword, password.frame.size.width, password.frame.size.height);
    borderPassword.borderWidth = borderWidthPassword;
    [password.layer addSublayer:borderPassword];
    password.layer.masksToBounds = YES;
    
    //border class text field
    CALayer *borderClass = [CALayer layer];
    CGFloat borderWidthClass = 1;
    borderClass.borderColor = [UIColor darkGrayColor].CGColor;
    borderClass.frame = CGRectMake(0, classe.frame.size.height - borderWidthClass, classe.frame.size.width, classe.frame.size.height);
    borderClass.borderWidth = borderWidthClass;
    [classe.layer addSublayer:borderClass];
    classe.layer.masksToBounds = YES;
    
    
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
