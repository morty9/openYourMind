//
//  Assos.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Assos : NSObject {
    
    NSInteger assosId_;
    NSInteger schoolId_;
    NSString* name_;
    NSString* description_;
    NSInteger presidentId_;
    NSArray* members_;
    NSInteger typeId_;
    NSInteger noteId_;
}

@property (nonatomic, assign) NSInteger assosId;
@property (nonatomic, assign) NSInteger schoolId;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, assign) NSInteger presidentId;
@property (nonatomic, strong) NSArray* members;
@property (nonatomic, assign) NSInteger typeId;
@property (nonatomic, assign) NSInteger noteId;

- (instancetype) initWithId:(NSInteger)assosId schoolId:(NSInteger)schoolId name:(NSString*)name description:(NSString*)description presidentId:(NSInteger)presidentId members:(NSArray*)members typeId:(NSInteger)typeId noteId:(NSInteger)noteId;

@end
