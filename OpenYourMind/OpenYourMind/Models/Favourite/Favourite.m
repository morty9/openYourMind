//
//  Favourite.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Favourite.h"

@implementation Favourite

@synthesize id_favourite = id_favourite_;
@synthesize id_user = id_user_;
@synthesize id_asso = id_asso_;

- (instancetype) initWithId:(NSNumber*)id_favourite id_user:(NSNumber*)id_user id_asso:(NSNumber*)id_asso {
    
    self = [super init];
    
    if (self != nil) {
        self.id_favourite = id_favourite;
        self.id_user = id_user;
        self.id_asso = id_asso;
    }
    return self;
}

@end

