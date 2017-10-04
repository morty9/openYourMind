//
//  Users.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Users : NSObject {
    
    NSInteger userId_;
    NSString* lastname_;
    NSString* firstname_;
    NSString* email_;
    NSString* password_;
    NSString* classUser_;
    NSInteger role_;
    NSInteger schoolId_;
    NSArray* favourite_;
    
}

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSString* lastname;
@property (nonatomic, strong) NSString* firstname;
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* password;
@property (nonatomic, strong) NSString* classUser;
@property (nonatomic, assign) NSInteger role;
@property (nonatomic, assign) NSInteger schoolId;
@property (nonatomic, strong) NSArray* favourite;

- (instancetype) initWithId:(NSInteger)userId lastname:(NSString*)lastname firstname:(NSString*)firstname email:(NSString*)email password:(NSString*)password classUser:(NSString*)classUser role:(NSInteger)role schoolId:(NSInteger)schoolId favourite:(NSArray*)favourite;

@end
