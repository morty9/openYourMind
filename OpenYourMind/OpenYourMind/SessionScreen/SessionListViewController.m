//
//  SessionListViewController.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 06/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "SessionListViewController.h"
#import "Session.h"
#import "crudSessions.h"
#import "SessionScreenViewController.h"
#import "CallScreenViewController.h"

@interface SessionListViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SessionListViewController {
    
    Session* session;
    crudSessions* cSession;
    
    NSArray<Session*>* session_array;
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [NSString stringWithFormat:@"Mes sessions"];
    self.navigationItem.hidesBackButton = YES;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createSession)];
    addButton.tintColor = [UIColor colorWithRed:0.14 green:0.22 blue:0.27 alpha:1.0];
    [self.navigationItem setRightBarButtonItem:addButton];
    
    session = [[Session alloc] init];
    cSession = [[crudSessions alloc] init];
    session_array = [[NSArray<Session*> alloc] init];
    
    [cSession getSessions:^(NSError *error, BOOL success) {
        if (success) {
            session_array = cSession.sessionList;
            NSLog(@"SESSION %@", session_array);
        }
    }];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView reloadData];
}

- (void) createSession {
    SessionScreenViewController* sessionScreen = [[SessionScreenViewController alloc] init];
    [self.navigationController pushViewController:sessionScreen animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return session_array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* const kCellId = @"cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellId];
    }
    
    Session* ses;

    ses = [session_array objectAtIndex:indexPath.row];
    
    cell.textLabel.text = ses.name;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CallScreenViewController* callScreen = [[CallScreenViewController alloc] init];
    [self.navigationController pushViewController:callScreen animated:YES];
    
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
