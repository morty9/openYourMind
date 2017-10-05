//
//  crudUsers.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Users.h"

@interface crudUsers : NSObject {
    NSMutableArray<Users*>* userList_;
    NSDictionary* dictError_;
    Users* user_;
}

@property (nonatomic, strong) NSMutableArray<Users*>* userList;
@property (nonatomic, strong) Users* user;
@property (nonatomic, strong) NSDictionary* dictError;


- (void) addLastname:(NSString*)lastname firstname:(NSString*)firstname email:(NSString*)email password:(NSString*)password class:(NSString*)class id_school:(NSInteger)id_school id_role:(NSInteger)id_role callback:(void (^)(NSError *error, BOOL success))callback;

- (void) getUsers:(void (^)(NSError *error, BOOL success))callback;

- (void) getUserById:(NSInteger)userId callback:(void (^)(NSError *error, BOOL success))callback;

- (void) updateUserId:(NSInteger)id_user lastname:(NSString*)lastname firstname:(NSString*)firstname email:(NSString*)email password:(NSString*)password class:(NSString*)class id_role:(NSInteger)id_role id_school:(NSInteger)id_school token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

- (void) deleteUserWithId:(NSInteger)id_user token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

@end

