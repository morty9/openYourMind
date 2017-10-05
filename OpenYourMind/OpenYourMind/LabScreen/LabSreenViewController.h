//
//  LabSreenViewController.h
//  OpenYourMind
//
//  Created by nico on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assos.h"

@interface LabSreenViewController : UIViewController {
    @private
    Assos* assos_;
}

@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *notationLabel;
@property (weak, nonatomic) IBOutlet UILabel *description;

@property (weak, nonatomic) Assos* assos;
- (IBAction)inscriptButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end
