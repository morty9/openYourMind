//
//  SignUpViewController.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController {
    
    __weak IBOutlet UITextField *name;
    __weak IBOutlet UITextField *firstname;
    __weak IBOutlet UITextField *email;
    __weak IBOutlet UITextField *password;
    
    __weak IBOutlet UIPickerView *school;
    
}

@end
