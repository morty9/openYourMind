//
//  SessionScreenViewController.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 06/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SessionScreenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *Description;
@property (weak, nonatomic) IBOutlet UITextField *Salle;
@property (weak, nonatomic) IBOutlet UITextField *Date;

@end
