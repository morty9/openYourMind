////
////  crudUsers.m
////  OpenYourMind
////
////  Created by Bérangère La Touche on 05/10/2017.
////  Copyright © 2017 Bérangère La Touche. All rights reserved.
////
//
//#import "crudUsers.h"
//#import "Users.h"
//#import "SynchronousMethod.h"
//
//@implementation crudUsers {
//    SynchronousMethod* synchronousMethod;
//}
//
//@synthesize dictError = dictError_;
//
//- (instancetype) init {
//    self = [super init];
//    
//    if (self != nil) {
//        self.userList = [[NSMutableArray<Users*> alloc] init];
//        self.user = [[Users alloc] init];
//    }
//    return self;
//}
//
//
///**
// * \fn (void) addNickname:(NSString*)nickname fullname:(NSString*)fullname email:(NSString*)email password:(NSString*)password callback:(void (^)(NSError *error, BOOL success))callback
// * \brief Add user to database.
// * \details Function which calls the web services users and the method create from the users crud.
// * \param lastname Nickname of the user.
// * \param firstname Fullname of the user.
// * \param email Email of the user.
// * \param password Password of the user.
// */
//- (void) addLastname:(NSString*)lastname firstname:(NSString*)firstname email:(NSString*)email password:(NSString*)password class:(NSString*)class school:(NSInteger)schoolId fav:(NSArray*)fav callback:(void (^)(NSError *error, BOOL success))callback {
//    
//    self.dictError = [[NSDictionary alloc] init];
//    
//    NSURL *url = [NSURL URLWithString:@"URL APIIIIIIIII"];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    
//    NSDictionary<NSString*, NSString*> *jsonData = @{@"name" : lastname,
//                                                     @"firstName" : firstname,
//                                                     @"email" : email,
//                                                     @"password" : password,
//                                                     @"class" : class,
//                                                     @"school" : [NSNumber numberWithInteger:schoolId],
//                                                     @"fav" : fav};
//    
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:jsonData options:0 error:nil];
//    [request setHTTPBody:postData];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    
//    
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
//        
//        if (error != nil) {
//            NSLog(@"Error: %@", error.localizedDescription);
//            return;
//        }
//        
//        if (data == nil) {
//            return;
//        }
//        
//        if (response == nil) {
//            return;
//        }
//        
//        if ([jsonDict valueForKey:@"type"] != nil) {
//            self.dictError = jsonDict;
//        }
//        
//        callback(error, true);
//        
//    }] resume];
//}
//
//
///**
// * \fn (void) getUsers:(void (^)(NSError *error, BOOL success))callback
// * \brief Get all users.
// * \details Function which calls the web services users and the method findAll from the users crud.
// */
//- (void) getUsers:(void (^)(NSError *error, BOOL success))callback {
//    
//    NSURL *url = [NSURL URLWithString:@"URL APIIIIIIIII"];
//    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
//    [request setHTTPMethod:@"GET"];
//    
//    NSError *error;
//    NSURLResponse *response;
//    NSData *data = [synchronousMethod sendSynchronousRequest:request returningResponse:&response error:&error];
//    
//    if (data) {
//        NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
//        
//        for (NSDictionary* user in jsonDict) {
//            NSNumber* tmp_id = [user valueForKey:@"id"];
//            NSString* tmp_lastname = [user valueForKey:@"lastname"];
//            NSString* tmp_firstname = [user valueForKey:@"firstname"];
//            NSString* tmp_email = [user valueForKey:@"email"];
//            NSString* tmp_password = [user valueForKey:@"password"];
//            NSString* tmp_class = [user valueForKey:@"class"];
//            NSNumber* tmp_role = [user valueForKey:@"role"];
//            NSNumber* tmp_schoolId = [user valueForKey:<#(nonnull NSString *)#>]
//            
//            Users* u = [[Users alloc] initWithId:tmp_id nickname:tmp_nickname fullname:tmp_fullname email:tmp_email password:tmp_password id_tasks:tmp_tasks];
//            
//            Users* u = [[Users alloc] initWithId:[tmp_id integerValue] lastname:tmp_lastname firstname:tmp_firstname email:tmp_email password:tmp_password classUser:tmp_class role:<#(NSInteger)#> schoolId:<#(NSInteger)#> favourite:<#(NSArray *)#>]
//            
//            [self.userList addObject:u];
//        }
//        
//        
//        callback(error, true);
//    } else {
//        NSLog(@"Error: %@", error.localizedDescription);
//        return;
//    }
//    
//}
//
//
///**
// * \fn (void) getUserById:(NSString*)userId callback:(void (^)(NSError *error, BOOL success))callback
// * \brief Get user by id.
// * \details Function which calls the web services users and the method findOne from the users crud.
// * \param userId Id of the user.
// */
//- (void) getUserById:(NSString*)userId callback:(void (^)(NSError *error, BOOL success))callback {
//    
//    NSURL *url = [NSURL URLWithString:[kUser_api stringByAppendingString:[@"/" stringByAppendingString:userId]]];
//    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
//    [request setHTTPMethod:@"GET"];
//    
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
//        
//        if (error != nil) {
//            NSLog(@"Error: %@", error.localizedDescription);
//            return;
//        }
//        
//        if (data == nil) {
//            return;
//        }
//        
//        if (response == nil) {
//            return;
//        }
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSString* tmp_id = [jsonDict valueForKey:@"id"];
//            NSString* tmp_nickname = [jsonDict valueForKey:@"nickname"];
//            NSString* tmp_fullname = [jsonDict valueForKey:@"fullname"];
//            NSString* tmp_email = [jsonDict valueForKey:@"email"];
//            NSString* tmp_password = [jsonDict valueForKey:@"password"];
//            NSMutableArray* tmp_id_tasks = [jsonDict valueForKey:@"id_tasks"];
//            
//            self.user = [[User alloc] initWithId:tmp_id nickname:tmp_nickname fullname:tmp_fullname email:tmp_email password:tmp_password id_tasks:tmp_id_tasks];
//            
//            
//            NSLog(@"User %@", self.user);
//            
//            callback(error, true);
//            
//        });
//        
//    }]resume];
//    
//}
//
//
///**
// * \fn (void) updateUserId:(NSString*)id_user nickname:(NSString*)nickname fullname:(NSString*)fullname email:(NSString*)email password:(NSString*)password token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback
// * \brief Update user.
// * \details Function which calls the web services users and the method update from the users crud.
// * \param id_user Id of the user.
// * \param nickname Nickname of the user.
// * \param fullname Fullname of the user.
// * \param email Email of the user.
// * \param password Password of the user.
// * \param token Token of the connected user.
// */
//- (void) updateUserId:(NSString*)id_user nickname:(NSString*)nickname fullname:(NSString*)fullname email:(NSString*)email password:(NSString*)password token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback {
//    
//    
//    NSURL *url = [NSURL URLWithString:[kUser_api stringByAppendingString:[@"/" stringByAppendingString:id_user]]];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//    [request setHTTPMethod:@"PUT"];
//    [request setValue:token forHTTPHeaderField:@"Authorization"];
//    
//    NSDictionary<NSString*, NSString*> *jsonData = @{@"nickname" : nickname,
//                                                     @"fullname" : fullname,
//                                                     @"email"  : email,
//                                                     @"password" : password};
//    
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:jsonData options:0 error:nil];
//    [request setHTTPBody:postData];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        if (error != nil) {
//            NSLog(@"Error: %@", error.localizedDescription);
//            return;
//        }
//        
//        if (data == nil) {
//            return;
//        }
//        
//        if (response == nil) {
//            return;
//        }
//        
//        callback(error, true);
//        
//    }] resume];
//    
//}
//
//
///**
// * \fn (void) deleteUserWithId:(NSString*)id_user token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback
// * \brief Delete user.
// * \details Function which calls the web services users and the method delete from the users crud.
// * \param id_user Id of the user.
// * \param token Token of the connected user.
// */
//- (void) deleteUserWithId:(NSString*)id_user token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback {
//    
//    NSURL* url = [NSURL URLWithString:[kUser_api stringByAppendingString:[@"/" stringByAppendingString:id_user]]];
//    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
//    
//    [request setHTTPMethod:@"DELETE"];
//    [request setValue:token forHTTPHeaderField:@"Authorization"];
//    
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        if (error != nil) {
//            NSLog(@"Error: %@", error.localizedDescription);
//            return;
//        }
//        
//        if (data == nil) {
//            return;
//        }
//        
//        if (response == nil) {
//            return;
//        }
//        
//        callback(error, true);
//        
//    }] resume];
//    
//}
//
//@end
