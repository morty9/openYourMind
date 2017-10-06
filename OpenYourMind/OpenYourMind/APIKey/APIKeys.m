//
//  APIKeys.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 06/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIKeys.h"

@interface APIKeys ()

@end

@implementation APIKeys

static Users* userConnected;

+ (Users*) getUser {
    return userConnected;
}

+ (void) setUserNameWithObjectUser:(Users*) newUser {
    userConnected = newUser;
}

@end
