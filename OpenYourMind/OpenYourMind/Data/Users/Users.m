//
//  Users.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Users.h"

@implementation Users

@synthesize userId = userId_;
@synthesize lastname = lastname_;
@synthesize firstname = firstname_;
@synthesize email = email_;
@synthesize password = password_;
@synthesize classUser = classUser_;
@synthesize role = role_;
@synthesize schoolId = schoolId_;
@synthesize favourite = favourite_;

-(instancetype)initWithId:(NSInteger)userId lastname:(NSString *)lastname firstname:(NSString *)firstname email:(NSString *)email password:(NSString *)password classUser:(NSString *)classUser role:(NSInteger)role schoolId:(NSInteger)schoolId favourite:(NSArray *)favourite {
    
    self = [super init];
    
    if (self != nil) {
        self.userId = userId;
        self.lastname = lastname;
        self.firstname = firstname;
        self.email = email;
        self.password = password;
        self.classUser = classUser;
        self.role = role;
        self.schoolId = schoolId;
        self.favourite = favourite;
    }
    return self;
}

@end
