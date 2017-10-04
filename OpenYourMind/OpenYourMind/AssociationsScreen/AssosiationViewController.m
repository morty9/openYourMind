//
//  AssosiationViewController.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "AssosiationViewController.h"
#import "AssoCollectionViewCell.h"

@interface AssosiationViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@end

@implementation AssosiationViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self != nil) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = [NSString stringWithFormat:@"Associations"];
    self.navigationItem.hidesBackButton = YES;
    
    self.assoCollectionView.delegate = self;
    self.assoCollectionView.dataSource = self;
    
    [self.assoCollectionView registerNib:[UINib nibWithNibName:@"AssoCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:@"Cell"];
    
    [self.assoCollectionView reloadData];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
