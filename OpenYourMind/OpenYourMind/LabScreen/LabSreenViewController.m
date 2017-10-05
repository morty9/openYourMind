//
//  LabSreenViewController.m
//  OpenYourMind
//
//  Created by nico on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "LabSreenViewController.h"

@interface LabSreenViewController ()

@end

@implementation LabSreenViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self != nil) {
        self.description.text = self.assos.description;
        self.notationLabel.text = @"10";
    }
    
    return self;
}
- (IBAction)inscripButton:(id)sender {
    self.btn.titleLabel.text = @"Annuler";
    self.btn.backgroundColor = [UIColor redColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)stepperAction:(UIStepper*)sender {
    NSUInteger value = sender.value;
    self.notationLabel.text = [NSString stringWithFormat:@"%02lu", (unsigned long)value];
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

