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

@interface AssosiationViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@end

@implementation AssosiationViewController {
    
    Assos* assos;
    crudAssos* cAssos;
    
    NSArray<Assos*>* getAssos;
    
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self != nil) {
        assos = [[Assos alloc] init];
        cAssos = [[crudAssos alloc] init];
        getAssos = [[NSArray alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self designPage];
    
    [cAssos getAssos:^(NSError *error, BOOL success) {
        if (success) {
            getAssos = cAssos.assoList;
            NSLog(@"ASSOS %@", getAssos);
        }
    }];
    
    self.assoCollectionView.delegate = self;
    self.assoCollectionView.dataSource = self;
    
    [self.assoCollectionView registerNib:[UINib nibWithNibName:@"AssoCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:@"Cell"];
    
    [self.assoCollectionView reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 20;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellId = @"Cell";
    
    AssoCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AssoCollectionViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void) addFavourite {
    
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
