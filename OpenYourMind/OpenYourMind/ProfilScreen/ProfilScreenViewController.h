//
//  ProfilScreenViewController.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfilScreenViewController : UIViewController {
    
    __weak IBOutlet UIImageView *imageProfil;
    __weak IBOutlet UITextField *lastname;
    __weak IBOutlet UITextField *firstname;
    __weak IBOutlet UITextField *email;
    __weak IBOutlet UITextField *password;
    __weak IBOutlet UITextField *classe;
    
}

@end
