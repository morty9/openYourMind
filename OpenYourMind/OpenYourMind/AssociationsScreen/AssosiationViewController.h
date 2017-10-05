//
//  AssosiationViewController.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssosiationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *assoCollectionView;
@property (strong, nonatomic) UISearchController *searchController;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
