//
//  APIKeys.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#ifndef APIKeys_h
#define APIKeys_h
#import "Users.h"

static NSString* kUser_api = @"http://127.0.0.1:3000/users";
static NSString* kAuthLogin_api = @"http://127.0.0.1:3000/auth/login";
static NSString* kAuthLogout_api = @"http://127.0.0.1:3000/auth/logout";
static NSString* kSchools_api = @"http://127.0.0.1:3000/schools";
static NSString* kTypes_api = @"http://127.0.0.1:3000/types";
static NSString* kNotes_api = @"http://127.0.0.1:3000/notes";
static NSString* kInscrits_api = @"http://127.0.0.1:3000/inscrits";
static NSString* kRoles_api = @"http://127.0.0.1:3000/roles";
static NSString* kAssos_api = @"http://127.0.0.1:3000/assos";
static NSString* kEvents_api = @"http://127.0.0.1:3000/events";
static NSString* kSessions_api = @"http://127.0.0.1:3000/sessions";
static NSString* kFavourite_api = @"http://127.0.0.1:3000/favourites";
static NSString* kLogin_Api = @"http://127.0.0.1:3000/auth/login";

static Users* userConnected;

#endif /* APIKeys_h */
