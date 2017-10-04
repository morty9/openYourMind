//
//  Notes.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notes : NSObject {
    
    NSInteger noteId_;
    NSInteger studentId_;
    NSString* note_;
    
}

@property (nonatomic, assign) NSInteger noteId;
@property (nonatomic, assign) NSInteger studentId;
@property (nonatomic, strong) NSString* note;

- (instancetype) initWithId:(NSInteger)nodeId studentId:(NSInteger)studentId note:(NSString*)note;

@end
