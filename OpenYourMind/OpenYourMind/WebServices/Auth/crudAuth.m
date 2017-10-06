//
//  crudAuth.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 06/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "crudAuth.h"
#import "APIKeys.h"

@implementation crudAuth

@synthesize user = user_;
@synthesize dict_error = _dict_error;

- (instancetype) init {
    self = [super init];
    
    if (self != nil) {
    }
    return self;
}

- (void) login:(NSString*)email password:(NSString*)password callback:(void (^)(NSError *error, BOOL success))callback {
    
    self.dict_error = [[NSDictionary alloc] init];
    
    NSURL *url = [NSURL URLWithString:kLogin_Api];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSDictionary<NSString*, NSString*> *jsonData = @{@"email" : email,
                                                     @"password" : password};
    
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
            _dict_error = jsonDict;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSDictionary* tmpDict = [jsonDict valueForKey:@"userId"];
            
            NSNumber* tmp_id = [tmpDict valueForKey:@"id"];
            NSString* tmp_lastname = [tmpDict valueForKey:@"lastname"];
            NSString* tmp_firstname = [tmpDict valueForKey:@"firstname"];
            NSString* tmp_email = [tmpDict valueForKey:@"email"];
            NSString* tmp_password = [tmpDict valueForKey:@"password"];
            NSString* tmp_class = [tmpDict valueForKey:@"class"];
            NSNumber* tmp_id_role = [tmpDict valueForKey:@"id_role"];
            NSNumber* tmp_id_school = [tmpDict valueForKey:@"id_school"];
            
            self.user = [[Users alloc] initWithId:tmp_id lastname:tmp_lastname firstname:tmp_firstname email:tmp_email password:tmp_password classUser:tmp_class id_role:tmp_id_role id_school:tmp_id_school];
        
            [APIKeys setUserNameWithObjectUser:self.user];
            
            callback(error, true);
            
            
        });
        
        
    }] resume];
}

@end
