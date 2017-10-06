//
//  crudAuth.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 06/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Users.h"

@interface crudAuth : NSObject {
    
    Users* user_;
    NSDictionary* _dict_error;
    
}

@property (nonatomic, strong) Users* user;
@property (nonatomic, strong) NSDictionary* dict_error;

- (void) login:(NSString*)email password:(NSString*)password callback:(void (^)(NSError *error, BOOL success))callback;

@end

