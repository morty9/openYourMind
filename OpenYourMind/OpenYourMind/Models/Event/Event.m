//
//  Event.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Event.h"

@implementation Event

@synthesize id_event = id_event_;
@synthesize description = description_;
@synthesize id_asso = id_asso_;
@synthesize date = date_;
@synthesize salle = salle_;

- (instancetype) initWithId:(NSInteger*)id_event description:(NSString*)description date:(NSDate*)date salle:(NSString*)salle id_asso:(NSInteger*)id_asso {
    
    self = [super init];
    
    if (self != nil) {
        self.id_event = id_event;
        self.description = description;
        self.id_asso = id_asso;
        self.date = date;
        self.salle = salle;
    }
    return self;
}

@end
