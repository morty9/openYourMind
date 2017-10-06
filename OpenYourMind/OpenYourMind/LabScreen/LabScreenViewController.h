//
//  LabScreenViewController.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assos.h"

@interface LabScreenViewController : UIViewController {
@private
    Assos* assos_;
}

@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *notationLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) Assos* assos;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UILabel *ideaLabel;
@property (weak, nonatomic) IBOutlet UITextField *ideaTextField;

@end
