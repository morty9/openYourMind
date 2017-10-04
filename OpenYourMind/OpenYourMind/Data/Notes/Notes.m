//
//  Notes.m
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import "Notes.h"

@implementation Notes

@synthesize noteId = noteId_;
@synthesize studentId = studentId_;
@synthesize note = note_;

-(instancetype)initWithId:(NSInteger)nodeId studentId:(NSInteger)studentId note:(NSString *)note {
    
    self = [super init];
    
    if (self != nil) {
        self.noteId = nodeId;
        self.studentId = studentId;
        self.note = note;
    }
    
    return self;
    
}

@end
