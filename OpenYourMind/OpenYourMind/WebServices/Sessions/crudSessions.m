//
//  crudSessions.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "crudSessions.h"
#import "SynchronousMethod.h"
#import "Session.h"
#import "APIKeys.h"

@implementation crudSessions {
    SynchronousMethod* synchronousMethod;
}

@synthesize dictError = dictError_;

- (instancetype) init {
    self = [super init];
    
    if (self != nil) {
        self.sessionList = [[NSMutableArray<Session*> alloc] init];
        self.session = [[Session alloc] init];
    }
    return self;
}


- (void) addDescription:(NSString*)description id_asso:(NSNumber*)id_asso dateSession:(NSDate*)dateSession salle:(NSString*)salle callback:(void (^)(NSError *error, BOOL success))callback {
    
    self.dictError = [[NSDictionary alloc] init];
    
    NSURL *url = [NSURL URLWithString:kSessions_api];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSDictionary<NSString*, NSString*> *jsonData = @{@"description" : description,
                                                     @"id_asso" : id_asso,
                                                     @"dateSession" : dateSession,
                                                     @"salle" : salle};
    
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


- (void) getSessions:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:kSessions_api];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSError *error;
    NSURLResponse *response;
    NSData *data = [synchronousMethod sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (data) {
        NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        
        for (NSDictionary* session in jsonDict) {
            NSNumber* tmp_id = [session valueForKey:@"id"];
            NSString* tmp_description = [session valueForKey:@"description"];
            NSNumber* tmp_id_asso = [session valueForKey:@"id_asso"];
            NSDate* tmp_date = [session valueForKey:@"date"];
            NSString* tmp_salle = [session valueForKey:@"salle"];
            
            Session* s = [[Session alloc] initWithId:tmp_id description:tmp_description date:tmp_date salle:tmp_salle id_asso:tmp_id_asso];
            
            [self.sessionList addObject:s];
        }
        
        
        callback(error, true);
    } else {
        NSLog(@"Error: %@", error.localizedDescription);
        return;
    }
    
}


- (void) getSessionById:(NSNumber*)sessionId callback:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:[kUser_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)sessionId]]]];
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
            NSString* tmp_description = [jsonDict valueForKey:@"description"];
            NSNumber* tmp_id_asso = [jsonDict valueForKey:@"id_asso"];
            NSDate* tmp_date = [jsonDict valueForKey:@"date"];
            NSString* tmp_salle = [jsonDict valueForKey:@"salle"];
            
            self.session = [[Session alloc] initWithId:tmp_id description:tmp_description date:tmp_date salle:tmp_salle id_asso:tmp_id_asso];
            
            callback(error, true);
            
        });
        
    }]resume];
    
}


- (void) updateSessionId:(NSNumber*)id_session description:(NSString*)description id_asso:(NSNumber*)id_asso dateSession:(NSDate*)dateSession salle:(NSString*)salle token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback {
    
    
    NSURL *url = [NSURL URLWithString:[kSessions_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)id_session]]]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"PUT"];
    [request setValue:token forHTTPHeaderField:@"Authorization"];
    
    NSDictionary<NSString*, NSString*> *jsonData = @{@"description" : description,
                                                     @"id_asso" : id_asso,
                                                     @"dateSession" : dateSession,
                                                     @"salle" : salle};
    
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

- (void) deleteSessionWithId:(NSNumber*)id_session token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:[kUser_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)id_session]]]];
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
