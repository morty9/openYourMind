//
//  CallScreenViewController.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 06/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "CallScreenViewController.h"
#import "crudInscrit.h"
#import "Inscrits.h"
#import "crudUsers.h"
#import "Users.h"

@interface CallScreenViewController () <UITableViewDelegate, UITableViewDataSource> {
    
    crudInscrit* cInscrit;
    Inscrits* inscrits;
    Users* userInscrit;
    crudUsers *cUser;
    
    NSArray<Inscrits*>* get_inscrits;
    NSMutableArray<Users*>* users_array;
    NSMutableArray<Users*>* members;
}

@end

@implementation CallScreenViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self != nil) {
        cInscrit = [[crudInscrit alloc] init];
        inscrits = [[Inscrits alloc] init];
        get_inscrits = [[NSArray alloc] init];
        userInscrit = [[Users alloc] init];
        users_array = [[NSMutableArray<Users*> alloc] init];
        cUser = [[crudUsers alloc] init];
        members = [[NSMutableArray<Users*> alloc] init];
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [NSString stringWithFormat:@"Feuille d'appel"];
    
    [cInscrit getInscrit:^(NSError *error, BOOL success) {
        if (success) {
            get_inscrits = cInscrit.inscritList;
            [self getUserInscrit];
        }
    }];
    
    self.inscritsTB.delegate = self;
    self.inscritsTB.dataSource = self;
    
    [self.inscritsTB reloadData];
    
}

- (void) getUserInscrit {
    
    for (Inscrits* ins in get_inscrits) {
        [cUser getUserById:ins.id_user callback:^(NSError *error, BOOL success) {
            if (success) {
                [users_array addObject:cUser.user];
            }
        }];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return users_array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* const kCellId = @"cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellId];
    }
    
    Users* user;
    user = [users_array objectAtIndex:indexPath.row];

    cell.textLabel.text = [user.lastname stringByAppendingString:[@" " stringByAppendingString:user.firstname]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.inscritsTB cellForRowAtIndexPath:indexPath];
    Users* userSelected = [users_array objectAtIndex:indexPath.row];
    if (cell.accessoryType) {
        cell.accessoryType = NO;
        [members removeObject:userSelected];
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [members addObject:userSelected];
    }
}

- (IBAction)submitCall:(id)sender {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Feuille d'appel soumise" message:@"Votre feuille d'appel a été enregistré." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        
        [self updateInscrit];
        
    }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void) updateInscrit {
    
    for (Inscrits* i in get_inscrits) {
        for (Users* u in members) {
            
            if (u.id_user == i.id_user) {
                [cInscrit updateInscritId:i.id_inscrit id_user:i.id_user id_session:i.id_session status:YES token:nil callback:^(NSError *error, BOOL success) {
                    if (success) {
                        NSLog(@"UPDATE");
                    }
                }];
            }

        }
    }
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
