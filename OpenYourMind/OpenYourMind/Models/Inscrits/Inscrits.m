//
//  Inscrits.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Inscrits.h"

@implementation Inscrits

@synthesize id_inscrit = id_inscrit_;
@synthesize id_user = id_user_;
@synthesize id_session = id_session_;
@synthesize status = status_;

- (instancetype) initWithId:(NSNumber*)id_inscrit id_user:(NSNumber*)id_user id_session:(NSNumber*)id_session status:(BOOL)status {
    
    self = [super init];
    
    if (self != nil) {
        self.id_inscrit = id_inscrit;
        self.id_user = id_user;
        self.id_session = id_session;
        self.status = status;
    }
    return self;
}

@end
