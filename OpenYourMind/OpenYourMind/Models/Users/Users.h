//
//  Users.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Users : NSObject {
    
    NSInteger* id_user_;
    NSString* lastname_;
    NSString* firstname_;
    NSString* email_;
    NSString* password_;
    NSString* classUser_;
    NSInteger* id_role_;
    NSInteger* id_school_;
}

@property (nonatomic, assign) NSInteger* id_user;
@property (nonatomic, strong) NSString* lastname;
@property (nonatomic, strong) NSString* firstname;
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* password;
@property (nonatomic, strong) NSString* classUser;
@property (nonatomic, assign) NSInteger* id_role;
@property (nonatomic, assign) NSInteger* id_school;

- (instancetype) initWithId:(NSInteger*)id_user lastname:(NSString*)lastname firstname:(NSString*)firstname email:(NSString*)email password:(NSString*)password classUser:(NSString*)classUser id_role:(NSInteger*)id_role id_school:(NSInteger*)id_school;

@end
