//
//  Notes.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Notes.h"

@implementation Notes

@synthesize id_note = id_note_;
@synthesize description = description_;
@synthesize id_inscrit = id_inscrit_;
@synthesize id_session = id_session_;

- (instancetype) initWithId:(NSNumber*)id_note description:(NSNumber*)description id_inscrit:(NSNumber*)id_inscrit id_session:(NSNumber*)id_session {
    
    self = [super init];
    
    if (self != nil) {
        self.id_note = id_note;
        self.description = description;
        self.id_inscrit = id_inscrit;
        self.id_session = id_session;
    }
    
    return self;
    
}

@end
