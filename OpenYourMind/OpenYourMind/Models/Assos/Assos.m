//
//  Assos.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Assos.h"

@implementation Assos

@synthesize id_asso = id_asso_;
@synthesize id_school = id_school_;
@synthesize name = name_;
@synthesize description = description_;
@synthesize id_user = id_user_;
@synthesize id_type = id_type_;

- (instancetype) initWithId:(NSNumber*)id_asso id_school:(NSNumber*)id_school name:(NSString*)name description:(NSString*)description id_user:(NSNumber*)id_user id_type:(NSNumber*)id_type {
    
    self = [super init];
    
    if (self != nil) {
        self.id_asso = id_asso;
        self.id_school = id_school;
        self.name = name;
        self.description = description;
        self.id_user = id_user;
        self.id_type = id_type;
    }
    return self;
}

@end
