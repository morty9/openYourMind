//
//  HomeScreenViewController.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assos.h"

@interface HomeScreenViewController : UIViewController {
    
    NSArray<Assos*>* fav_asso_;
    
}

@property (nonatomic, strong) NSArray<Assos*>* fav_asso;
@property (strong, nonatomic) UISearchController *searchController;
@property (weak, nonatomic) IBOutlet UITableView *favouriteTV;

@end
