//
//  Inscrits.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Inscrits : NSObject {
    
    NSNumber* id_inscrit_;
    NSNumber* id_user_;
    NSNumber* id_session_;
    BOOL status_;
    
}

@property (nonatomic, strong) NSNumber* id_inscrit;
@property (nonatomic, strong) NSNumber* id_user;
@property (nonatomic, strong) NSNumber* id_session;
@property (nonatomic, assign) BOOL status;

- (instancetype) initWithId:(NSNumber*)id_inscrit id_user:(NSNumber*)id_user id_session:(NSNumber*)id_session status:(BOOL)status;

@end
