//
//  Type.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Type.h"

@implementation Type

@synthesize typeId = typeId_;
@synthesize type = type_;

-(instancetype)initWithId:(NSInteger)typeId type:(NSString *)type {
    
    self = [super init];
    
    if (self != nil) {
        self.typeId = typeId;
        self.type = type;
    }
    return self;
}

@end
