//
//  SessionScreenViewController.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 06/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "SessionScreenViewController.h"
#import "crudSessions.h"
#import "Session.h"

@interface SessionScreenViewController () <UITextFieldDelegate>

@end

@implementation SessionScreenViewController {
    Session* ses;
    crudSessions* cr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ses = [[Session alloc] init];
    cr = [[crudSessions alloc] init];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BtnValider:(id)sender {
    NSString* nom = self.name.text;
    NSString* desc = self.Description.text;
    NSString* salle = self.Salle.text;
    NSString* date = self.Date.text;
    NSLog(@"Valeurs: %@ %@ %@ %@", nom, desc, salle, date);
    
    [cr addDescription:desc id_asso:@(1) dateSession:nil salle:salle callback:^(NSError *error, BOOL success) {
        if(success){
            ses = cr.session;
        }
    }];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
