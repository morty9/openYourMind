//
//  Assos.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Assos : NSObject {
    
    NSNumber* id_asso_;
    NSNumber* id_school_;
    NSString* name_;
    NSString* description_;
    NSNumber* id_user_;
    NSNumber* id_type_;
}

@property (nonatomic, strong) NSNumber* id_asso;
@property (nonatomic, strong) NSNumber* id_school;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, strong) NSNumber* id_user;
@property (nonatomic, strong) NSNumber* id_type;

- (instancetype) initWithId:(NSNumber*)id_asso id_school:(NSNumber*)id_school name:(NSString*)name description:(NSString*)description id_user:(NSNumber*)id_user id_type:(NSNumber*)id_type;

@end
