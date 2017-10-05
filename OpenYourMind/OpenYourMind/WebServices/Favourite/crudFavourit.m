//
//  crudFavourit.m
//  OpenYourMind
//
//  Created by nico on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "crudFavourit.h"
#import "Favourite.h"
#import "SynchronousMethod.h"
#import "APIKeys.h"

@implementation crudFavourit {
    SynchronousMethod* synchronousMethod;
}

@synthesize dictError = dictError_;

- (instancetype) init {
    self = [super init];
    
    if (self != nil) {
        self.favouriteList = [[NSMutableArray<Favourite*> alloc] init];
        self.favourite = [[Favourite alloc] init];
        synchronousMethod = [[SynchronousMethod alloc] init];
    }
    return self;
}


- (void) addId_user:(NSNumber*)id_user id_asso:(NSNumber*)id_asso callback:(void (^)(NSError *error, BOOL success))callback {
    
    self.dictError = [[NSDictionary alloc] init];
    
    NSURL *url = [NSURL URLWithString:kFavourite_api];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSDictionary<NSString*, NSString*> *jsonData = @{@"id_user" : id_user,
                                                     @"id_asso" : id_asso};
    
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


- (void) getFavourite:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:kFavourite_api];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSError *error;
    NSURLResponse *response;
    NSData *data = [synchronousMethod sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (data) {
        NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        
        for (NSDictionary* favourite in jsonDict) {
            NSNumber* tmp_id = [favourite valueForKey:@"id"];
            NSNumber* tmp_id_user = [favourite valueForKey:@"id_user"];
            NSNumber* tmp_id_asso = [favourite valueForKey:@"id_asso"];
            
            Favourite* f = [[Favourite alloc] initWithId:tmp_id id_user:tmp_id_user id_asso:tmp_id_asso];
            
            [self.favouriteList addObject:f];
        }
        
        
        callback(error, true);
    } else {
        NSLog(@"Error: %@", error.localizedDescription);
        return;
    }
    
}


- (void) getFavouriteById:(NSNumber*)favouriteId callback:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:[kFavourite_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)favouriteId]]]];
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
            NSNumber* tmp_id_user = [jsonDict valueForKey:@"id_user"];
            NSNumber* tmp_id_asso = [jsonDict valueForKey:@"id_asso"];
            
            self.favourite = [[Favourite alloc] initWithId:tmp_id id_user:tmp_id_user id_asso:tmp_id_asso];
            
            
            NSLog(@"User %@", self.favourite);
            
            callback(error, true);
            
        });
        
    }]resume];
    
}


- (void) updateFavouriteId:(NSNumber*)id_favourite id_user:(NSNumber*)id_user id_asso:(NSNumber*)id_asso token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback {
    
    
    NSURL *url = [NSURL URLWithString:[kFavourite_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)id_favourite]]]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"PUT"];
    [request setValue:token forHTTPHeaderField:@"Authorization"];
    
    NSDictionary<NSString*, NSString*> *jsonData = @{@"id_user" : id_user,
                                                     @"id_asso" : id_asso};
    
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


- (void) deleteFavouriteWithId:(NSNumber*)id_favourite token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:[kFavourite_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)id_favourite]]]];
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
