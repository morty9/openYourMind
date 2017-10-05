//
//  Assos.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Assos : NSObject {
    
    NSInteger id_asso_;
    NSInteger id_school_;
    NSString* name_;
    NSString* description_;
    NSInteger id_user_;
    NSInteger id_type_;
}

@property (nonatomic, assign) NSInteger id_asso;
@property (nonatomic, assign) NSInteger id_school;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, assign) NSInteger id_user;
@property (nonatomic, assign) NSInteger id_type;

- (instancetype) initWithId:(NSInteger)id_asso id_school:(NSInteger)id_school name:(NSString*)name description:(NSString*)description id_user:(NSInteger)id_user id_type:(NSInteger)id_type;

@end
