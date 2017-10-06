//
//  LabScreenViewController.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "LabScreenViewController.h"
#import "crudInscrit.h"
#import "APIKeys.h"

@interface LabScreenViewController () {
    
    crudInscrit* cInscrit;
    
}

@end

@implementation LabScreenViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self != nil) {
        cInscrit = [[crudInscrit alloc] init];
    }
    
    return self;
}
- (IBAction)inscripButton:(id)sender {
    
    if ([self.btn.titleLabel.text  isEqual: @"S'inscrire"]) {
        [sender setTitle:@"Annuler" forState:UIControlStateNormal];
        self.btn.titleLabel.textColor = [UIColor whiteColor];
        self.btn.backgroundColor = [UIColor colorWithRed:0.86 green:0.28 blue:0.31 alpha:1.0];
        [self addMember];
    } else {
        [sender setTitle:@"S'inscrire" forState:UIControlStateNormal];
        self.btn.titleLabel.textColor = [UIColor whiteColor];
        self.btn.backgroundColor = [UIColor colorWithRed:0.10 green:0.67 blue:0.67 alpha:1.0];
    }
    
    
}

- (void) addMember {
    
    [cInscrit addId_user:userConnected id_session:[NSNumber numberWithInt:1] status:nil callback:^(NSError *error, BOOL success) {
        if (success) {
            NSLog(@"INSCRIT");
        }
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"%@", self.assos.name];
    self.descriptionLabel.layer.cornerRadius = 15;
    self.descriptionLabel.text = self.assos.description;
    self.notationLabel.text = @"10";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submitIdea:(id)sender {
    NSString* idea = self.ideaTextField.text;
    self.ideaLabel.text = idea;
    self.ideaTextField.text = @"";
}


- (IBAction)stepperAction:(UIStepper*)sender {
    NSUInteger value = sender.value;
    self.notationLabel.text = [NSString stringWithFormat:@"%02lu", (unsigned long)value];
}

@end
