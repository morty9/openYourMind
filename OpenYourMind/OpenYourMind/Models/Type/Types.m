//
//  Types.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Types.h"

@implementation Types

@synthesize id_type = id_type_;
@synthesize status = status_;

- (instancetype) initWithId:(NSNumber*)id_type status:(NSString*)status {
    
    self = [self init];
    
    if (self != nil) {
        self.id_type = id_type;
        self.status = status;
    }
    return self;
}

@end
