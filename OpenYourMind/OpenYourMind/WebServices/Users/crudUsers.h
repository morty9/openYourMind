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


- (void) addLastname:(NSString*)lastname firstname:(NSString*)firstname email:(NSString*)email password:(NSString*)password classUser:(NSString*)classUser id_school:(NSNumber*)id_school id_role:(NSNumber*)id_role callback:(void (^)(NSError *error, BOOL success))callback;

- (void) getUsers:(void (^)(NSError *error, BOOL success))callback;

- (void) getUserById:(NSNumber*)userId callback:(void (^)(NSError *error, BOOL success))callback;

- (void) updateUserId:(NSNumber*)id_user lastname:(NSString*)lastname firstname:(NSString*)firstname email:(NSString*)email password:(NSString*)password class:(NSString*)class id_role:(NSNumber*)id_role id_school:(NSNumber*)id_school token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

- (void) deleteUserWithId:(NSNumber*)id_user token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

@end

