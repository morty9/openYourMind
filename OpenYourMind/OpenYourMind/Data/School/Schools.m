//
//  Schools.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Schools.h"

@implementation Schools

@synthesize schoolId = schoolId_;
@synthesize name = name_;

- (instancetype)initWithId:(NSInteger)schoolId name:(NSString *)name {
    
    self = [super init];
    
    if (self != nil) {
        self.schoolId = schoolId;
        self.name = name;
    }
    
    return self;
}

@end
