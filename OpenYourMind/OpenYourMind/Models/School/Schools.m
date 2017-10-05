//
//  Schools.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Schools.h"

@implementation Schools

@synthesize id_school = id_school_;
@synthesize name = name_;

- (instancetype) initWithId:(NSNumber*)id_school name:(NSString*)name {
    
    self = [super init];
    
    if (self != nil) {
        self.id_school = id_school;
        self.name = name;
    }
    
    return self;
}

@end
