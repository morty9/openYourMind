//
//  AssosiationViewController.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "AssosiationViewController.h"
#import "AssoCollectionViewCell.h"
#import "crudAssos.h"
#import "Assos.h"
#import "ProfilScreenViewController.h"
#import "HomeScreenViewController.h"

@interface AssosiationViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@end

@implementation AssosiationViewController {
    
    Assos* assos;
    crudAssos* cAssos;
    
    ProfilScreenViewController* profilVC;
    HomeScreenViewController* homeVC;
    
    NSArray<Assos*>* getAssos;
    NSArray* searchResults;
    
    NSMutableArray<Assos*>* favourites;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self != nil) {
        assos = [[Assos alloc] init];
        cAssos = [[crudAssos alloc] init];
        getAssos = [[NSArray alloc] init];
        favourites = [[NSMutableArray<Assos*> alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self designPage];
    
    homeVC = [[HomeScreenViewController alloc] init];
    
    [cAssos getAssos:^(NSError *error, BOOL success) {
        if (success) {
            getAssos = cAssos.assoList;
        }
    }];
    
    self.assoCollectionView.delegate = self;
    self.assoCollectionView.dataSource = self;
    
    [self.assoCollectionView registerNib:[UINib nibWithNibName:@"AssoCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:@"Cell"];
    
    self.assoCollectionView.refreshControl = [[UIRefreshControl alloc] init];
    self.assoCollectionView.refreshControl.backgroundColor = [UIColor whiteColor];
    self.assoCollectionView.refreshControl.tintColor = [UIColor grayColor];
    [self.assoCollectionView.refreshControl addTarget:self
                            action:@selector(reload)
                  forControlEvents:UIControlEventValueChanged];
    
    [self.assoCollectionView reloadData];
    
}

- (void) reload {
    [self.assoCollectionView reloadData];
    [self.assoCollectionView.refreshControl endRefreshing];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (self.searchController.isActive) {
        return searchResults.count;
    } else {
        return getAssos.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellId = @"Cell";
    
    AssoCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AssoCollectionViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Assos* dAssos;
    
    if (self.searchController.isActive) {
        dAssos = [searchResults objectAtIndex:indexPath.row];
    } else {
        dAssos = [getAssos objectAtIndex:indexPath.row];
    }
    
    cell.titleAsso.text = dAssos.name;
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"SELECT");

    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];

    Assos* currentAssos = [getAssos objectAtIndex:indexPath.row];
    
    if (cell.backgroundColor == [UIColor grayColor]) {
        cell.backgroundColor = [UIColor colorWithRed:0.77 green:0.57 blue:0.13 alpha:1.0];
        [favourites removeObject:currentAssos];
    } else {
        cell.backgroundColor = [UIColor grayColor];
        [favourites addObject:currentAssos];
    }
}

- (void) addFavourite {
    homeVC.fav_asso = favourites;
    [self.navigationController pushViewController:homeVC animated:YES];
}

- (IBAction)reloadData:(id)sender {
    [self.assoCollectionView reloadData];
}

- (IBAction)profilPage:(id)sender {
    profilVC = [[ProfilScreenViewController alloc] init];
    [self.navigationController pushViewController:profilVC animated:YES];
}

- (IBAction)searchProjects:(id)sender {
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchController.searchBar;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    [self.searchController.searchBar setBarTintColor:[UIColor whiteColor]];
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    
}

// SEARCHBAR

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = self.searchController.searchBar.text;
    [self searchForText:searchString];
    
    [self.assoCollectionView reloadData];
}

- (void)searchForText:(NSString*)searchText {
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    searchResults = [getAssos filteredArrayUsingPredicate:predicate];
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    [self updateSearchResultsForSearchController:self.searchController];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.navigationItem.titleView = nil;
}


- (void) designPage {
    self.navigationItem.title = [NSString stringWithFormat:@"Associations"];
    self.navigationItem.hidesBackButton = YES;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(addFavourite)];
    addButton.tintColor = [UIColor colorWithRed:0.14 green:0.22 blue:0.27 alpha:1.0];
    [self.navigationItem setRightBarButtonItem:addButton];
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
