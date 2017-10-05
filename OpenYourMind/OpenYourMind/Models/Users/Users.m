//
//  Users.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Users.h"

@implementation Users

@synthesize id_user = id_user_;
@synthesize lastname = lastname_;
@synthesize firstname = firstname_;
@synthesize email = email_;
@synthesize password = password_;
@synthesize classUser = classUser_;
@synthesize id_role = id_role_;
@synthesize id_school = id_school_;

- (instancetype) initWithId:(NSInteger*)id_user lastname:(NSString*)lastname firstname:(NSString*)firstname email:(NSString*)email password:(NSString*)password classUser:(NSString*)classUser id_role:(NSInteger*)id_role id_school:(NSInteger*)id_school {
    
    self = [super init];
    
    if (self != nil) {
        self.id_user = id_user;
        self.lastname = lastname;
        self.firstname = firstname;
        self.email = email;
        self.password = password;
        self.classUser = classUser;
        self.id_role = id_role;
        self.id_school = id_school;
    }
    return self;
}

@end
