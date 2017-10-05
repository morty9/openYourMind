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


- (void) addName:(NSString*)name id_school:(NSInteger*)id_school description:(NSString*)description id_user:(NSInteger*)id_user id_type:(NSInteger*)id_type callback:(void (^)(NSError *error, BOOL success))callback {
    
    self.dictError = [[NSDictionary alloc] init];
    
    NSURL *url = [NSURL URLWithString:kUser_api];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSDictionary<NSString*, NSString*> *jsonData = @{@"name" : name,
                                                     @"id_school" : [NSNumber numberWithInteger:*id_school],
                                                     @"description" : description,
                                                     @"id_user" : [NSNumber numberWithInteger:*id_user],
                                                     @"id_type" : [NSNumber numberWithInteger:*id_type]};
    
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


- (void) getAssos:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:kAssos_api];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSError *error;
    NSURLResponse *response;
    NSData *data = [synchronousMethod sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (data) {
        NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        
        for (NSDictionary* asso in jsonDict) {
            NSNumber* tmp_id = [asso valueForKey:@"id"];
            NSString* tmp_id_school = [asso valueForKey:@"id_school"];
            NSString* tmp_name = [asso valueForKey:@"name"];
            NSString* tmp_description = [asso valueForKey:@"description"];
            NSString* tmp_id_user = [asso valueForKey:@"id_user"];
            NSString* tmp_id_type = [asso valueForKey:@"id_type"];
            
            Assos* a = [[Assos alloc] initWithId:[tmp_id integerValue] id_school:[tmp_id_school integerValue] name:tmp_name description:tmp_description id_user:[tmp_id_user integerValue] id_type:[tmp_id_type integerValue]];
            
            [self.assoList addObject:a];
        }
        
        
        callback(error, true);
    } else {
        NSLog(@"Error: %@", error.localizedDescription);
        return;
    }
    
}


- (void) getAssoById:(NSInteger*)userId callback:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:[kAssos_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)userId]]]];
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
            NSString* tmp_id_school = [jsonDict valueForKey:@"id_school"];
            NSString* tmp_name = [jsonDict valueForKey:@"name"];
            NSString* tmp_description = [jsonDict valueForKey:@"description"];
            NSString* tmp_id_user = [jsonDict valueForKey:@"id_user"];
            NSString* tmp_id_type = [jsonDict valueForKey:@"id_type"];
            
            self.asso = [[Assos alloc] initWithId:[tmp_id integerValue] id_school:[tmp_id_school integerValue] name:tmp_name description:tmp_description id_user:[tmp_id_user integerValue] id_type:[tmp_id_type integerValue]];
            
            callback(error, true);
            
        });
        
    }]resume];
    
}


- (void) updateAssoId:(NSInteger*)id_asso id_school:(NSInteger*)id_school name:(NSString*)name description:(NSString*)description id_user:(NSInteger*)password id_type:(NSInteger*)id_type token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback {
    
    
    NSURL *url = [NSURL URLWithString:[kAssos_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)id_asso]]]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"PUT"];
    [request setValue:token forHTTPHeaderField:@"Authorization"];
    
    NSDictionary<NSString*, NSString*> *jsonData = @{@"id_school" : [NSNumber numberWithInteger:*id_school],
                                                     @"name" : name,
                                                     @"description" : description,
                                                     @"id_user" : [NSNumber numberWithInteger:*id_user],
                                                     @"id_type" : [NSNumber numberWithInteger:*id_type]};
    
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


- (void) deleteAssoWithId:(NSInteger*)id_asso token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:[kAssos_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)id_asso]]]];
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
