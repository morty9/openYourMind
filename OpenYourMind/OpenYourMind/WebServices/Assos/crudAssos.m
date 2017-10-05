//
//  crudAssos.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "crudAssos.h"
#import "SynchronousMethod.h"
#import "Assos.h"
#import "APIKeys.h"

@implementation crudAssos {
    SynchronousMethod* synchronousMethod;
}

@synthesize dictError = dictError_;

- (instancetype) init {
    self = [super init];
    
    if (self != nil) {
        self.assoList = [[NSMutableArray<Assos*> alloc] init];
        self.asso = [[Assos alloc] init];
    }
    return self;
}


- (void) addName:(NSString*)name id_school:(NSInteger)id_school description:(NSString*)description id_user:(NSInteger)id_user id_type:(NSInteger)id_type callback:(void (^)(NSError *error, BOOL success))callback {
    
    self.dictError = [[NSDictionary alloc] init];
    
    NSURL *url = [NSURL URLWithString:kUser_api];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSDictionary<NSString*, NSString*> *jsonData = @{@"name" : name,
                                                     @"id_school" : [NSNumber numberWithInteger:id_school],
                                                     @"description" : description,
                                                     @"id_user" : [NSNumber numberWithInteger:id_user],
                                                     @"id_type" : [NSNumber numberWithInteger:id_type]};
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:jsonData options:0 error:nil];
    [request setHTTPBody:postData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        
        if (data == nil) {
            return;
        }
        
        if (response == nil) {
            return;
        }
        
        if ([jsonDict valueForKey:@"type"] != nil) {
            self.dictError = jsonDict;
        }
        
        callback(error, true);
        
    }] resume];
}


- (void) getUsers:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:kUser_api];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSError *error;
    NSURLResponse *response;
    NSData *data = [synchronousMethod sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (data) {
        NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        
        for (NSDictionary* user in jsonDict) {
            NSNumber* tmp_id = [user valueForKey:@"id"];
            NSString* tmp_lastname = [user valueForKey:@"lastname"];
            NSString* tmp_firstname = [user valueForKey:@"firstname"];
            NSString* tmp_email = [user valueForKey:@"email"];
            NSString* tmp_password = [user valueForKey:@"password"];
            NSString* tmp_class = [user valueForKey:@"class"];
            NSNumber* tmp_id_role = [user valueForKey:@"id_role"];
            NSNumber* tmp_id_school = [user valueForKey:@"id_school"];
            
            Users* u = [[Users alloc] initWithId:[tmp_id integerValue] lastname:tmp_lastname firstname:tmp_firstname email:tmp_email password:tmp_password classUser:tmp_class id_role:[tmp_id_role integerValue] id_school:[tmp_id_school integerValue]];
            
            [self.userList addObject:u];
        }
        
        
        callback(error, true);
    } else {
        NSLog(@"Error: %@", error.localizedDescription);
        return;
    }
    
}


- (void) getUserById:(NSInteger)userId callback:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:[kUser_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)userId]]]];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        
        if (data == nil) {
            return;
        }
        
        if (response == nil) {
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSNumber* tmp_id = [jsonDict valueForKey:@"id"];
            NSString* tmp_lastname = [jsonDict valueForKey:@"lastname"];
            NSString* tmp_firstname = [jsonDict valueForKey:@"firstname"];
            NSString* tmp_email = [jsonDict valueForKey:@"email"];
            NSString* tmp_password = [jsonDict valueForKey:@"password"];
            NSString* tmp_class = [jsonDict valueForKey:@"class"];
            NSNumber* tmp_id_role = [jsonDict valueForKey:@"id_role"];
            NSNumber* tmp_id_school = [jsonDict valueForKey:@"id_school"];
            
            self.user = [[Users alloc] initWithId:[tmp_id integerValue] lastname:tmp_lastname firstname:tmp_firstname email:tmp_email password:tmp_password classUser:tmp_class id_role:[tmp_id_role integerValue] id_school:[tmp_id_school integerValue]];
            
            
            NSLog(@"User %@", self.user);
            
            callback(error, true);
            
        });
        
    }]resume];
    
}


- (void) updateUserId:(NSInteger)id_user lastname:(NSString*)lastname firstname:(NSString*)firstname email:(NSString*)email password:(NSString*)password class:(NSString*)class id_role:(NSInteger)id_role id_school:(NSInteger)id_school token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback {
    
    
    NSURL *url = [NSURL URLWithString:[kUser_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)id_user]]]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"PUT"];
    [request setValue:token forHTTPHeaderField:@"Authorization"];
    
    NSDictionary<NSString*, NSString*> *jsonData = @{@"name" : lastname,
                                                     @"firstName" : firstname,
                                                     @"email" : email,
                                                     @"password" : password,
                                                     @"class" : class,
                                                     @"school" : [NSNumber numberWithInteger:id_school],
                                                     @"role" : [NSNumber numberWithInteger:id_role]};
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:jsonData options:0 error:nil];
    [request setHTTPBody:postData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        
        if (data == nil) {
            return;
        }
        
        if (response == nil) {
            return;
        }
        
        callback(error, true);
        
    }] resume];
    
}


- (void) deleteUserWithId:(NSInteger)id_user token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:[kUser_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)id_user]]]];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:@"DELETE"];
    [request setValue:token forHTTPHeaderField:@"Authorization"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        
        if (data == nil) {
            return;
        }
        
        if (response == nil) {
            return;
        }
        
        callback(error, true);
        
    }] resume];
    
}

@end
