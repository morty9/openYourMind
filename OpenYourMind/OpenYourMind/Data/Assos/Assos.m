//
//  Assos.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Assos.h"

@implementation Assos

@synthesize assosId = assosId_;
@synthesize schoolId = schoolId_;
@synthesize name = name_;
@synthesize description = description_;
@synthesize presidentId = presidentId_;
@synthesize members = members_;
@synthesize typeId = typeId_;
@synthesize noteId = noteId_;

-(instancetype)initWithId:(NSInteger)assosId schoolId:(NSInteger)schoolId name:(NSString *)name description:(NSString *)description presidentId:(NSInteger)presidentId members:(NSArray *)members typeId:(NSInteger)typeId noteId:(NSInteger)noteId {
    
    self = [super init];
    
    if (self != nil) {
        self.assosId = assosId;
        self.schoolId = schoolId;
        self.name = name;
        self.description = description;
        self.presidentId = presidentId;
        self.members = members;
        self.typeId = typeId;
        self.noteId = noteId;
    }
    return self;
}

@end
