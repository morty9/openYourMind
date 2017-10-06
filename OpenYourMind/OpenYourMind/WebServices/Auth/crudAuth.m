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

@synthesize id_user = id_user_;
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
        
        userConnected = [jsonDict valueForKey:@"userId"];
        
        callback(error, true);
        
    }] resume];
}

@end
