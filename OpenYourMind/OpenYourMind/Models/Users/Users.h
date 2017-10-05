//
//  Users.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Users : NSObject {
    
    NSNumber* id_user_;
    NSString* lastname_;
    NSString* firstname_;
    NSString* email_;
    NSString* password_;
    NSString* classUser_;
    NSNumber* id_role_;
    NSNumber* id_school_;
}

@property (nonatomic, strong) NSNumber* id_user;
@property (nonatomic, strong) NSString* lastname;
@property (nonatomic, strong) NSString* firstname;
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* password;
@property (nonatomic, strong) NSString* classUser;
@property (nonatomic, strong) NSNumber* id_role;
@property (nonatomic, strong) NSNumber* id_school;

- (instancetype) initWithId:(NSNumber*)id_user lastname:(NSString*)lastname firstname:(NSString*)firstname email:(NSString*)email password:(NSString*)password classUser:(NSString*)classUser id_role:(NSNumber*)id_role id_school:(NSNumber*)id_school;

@end
