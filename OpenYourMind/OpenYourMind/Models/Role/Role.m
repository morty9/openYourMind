//
//  Role.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Role.h"

@implementation Role

@synthesize id_role = id_role_;
@synthesize name = name_;

- (instancetype) initWithId:(NSNumber*)id_role name:(NSString*)name {
    
    self = [super init];
    
    if (self != nil) {
        self.id_role = id_role;
        self.name = name;
    }
    return self;
}

@end
