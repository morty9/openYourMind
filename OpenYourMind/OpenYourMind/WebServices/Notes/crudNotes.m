//
//  crudUsers.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "crudNotes.h"
#import "Notes.h"
#import "SynchronousMethod.h"
#import "APIKeys.h"

@implementation crudNotes {
    SynchronousMethod* synchronousMethod;
}

@synthesize dictError = dictError_;

- (instancetype) init {
    self = [super init];
    
    if (self != nil) {
        self.noteList = [[NSMutableArray<Notes*> alloc] init];
        self.note = [[Notes alloc] init];
    }
    return self;
}


- (void) addDescription:(NSNumber*)description id_inscrit:(NSNumber*)id_inscrit id_session:(NSNumber*)id_session callback:(void (^)(NSError *error, BOOL success))callback {
    
    self.dictError = [[NSDictionary alloc] init];
    
    NSURL *url = [NSURL URLWithString:kNotes_api];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSDictionary<NSString*, NSString*> *jsonData = @{@"description" : description,
                                                     @"id_inscrit" : id_inscrit,
                                                     @"id_session" : id_session};
    
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


- (void) getNotes:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:kNotes_api];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSError *error;
    NSURLResponse *response;
    NSData *data = [synchronousMethod sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (data) {
        NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        
        for (NSDictionary* note in jsonDict) {
            NSNumber* tmp_id = [note valueForKey:@"id"];
            NSNumber* tmp_description = [note valueForKey:@"description"];
            NSNumber* tmp_id_inscrit = [note valueForKey:@"id_inscrit"];
            NSNumber* tmp_id_session = [note valueForKey:@"id_session"];
            
            Notes* n = [[Notes alloc] initWithId:tmp_id description:tmp_description id_inscrit:tmp_id_inscrit id_session:tmp_id_session];
            
            [self.noteList addObject:n];
        }
        
        
        callback(error, true);
    } else {
        NSLog(@"Error: %@", error.localizedDescription);
        return;
    }
    
}


- (void) getNoteById:(NSNumber*)noteId callback:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:[kNotes_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)noteId]]]];
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
            NSNumber* tmp_description = [jsonDict valueForKey:@"description"];
            NSNumber* tmp_id_inscrit = [jsonDict valueForKey:@"id_inscrit"];
            NSNumber* tmp_id_session = [jsonDict valueForKey:@"id_session"];
            
            
            self.note = [[Notes alloc] initWithId:tmp_id description:tmp_description id_inscrit:tmp_id_inscrit id_session:tmp_id_session];
            
            
            NSLog(@"User %@", self.note);
            
            callback(error, true);
            
        });
        
    }]resume];
    
}


- (void) updateNoteId:(NSNumber*)id_note description:(NSNumber*)description id_inscrit:(NSNumber*)id_inscrit id_session:(NSNumber*)id_session token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback {
    
    
    NSURL *url = [NSURL URLWithString:[kNotes_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)id_note]]]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"PUT"];
    [request setValue:token forHTTPHeaderField:@"Authorization"];
    
    NSDictionary<NSString*, NSString*> *jsonData = @{@"description" : description,
                                                     @"id_inscrit" : id_inscrit,
                                                     @"id_session" : id_session};
    
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


- (void) deleteNoteWithId:(NSNumber*)id_note token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback {
    
    NSURL *url = [NSURL URLWithString:[kNotes_api stringByAppendingString:[@"/" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)id_note]]]];
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
