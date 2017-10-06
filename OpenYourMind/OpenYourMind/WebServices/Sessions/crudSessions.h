//
//  crudSessions.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Session.h"

@interface crudSessions : NSObject {
    NSMutableArray<Session*>* sessionList_;
    NSDictionary* dictError_;
    Session* session_;
}

@property (nonatomic, strong) NSMutableArray<Session*>* sessionList;
@property (nonatomic, strong) Session* session;
@property (nonatomic, strong) NSDictionary* dictError;


- (void) addName:(NSString*)name description:(NSString*)description id_asso:(NSNumber*)id_asso dateSession:(NSDate*)dateSession salle:(NSString*)salle callback:(void (^)(NSError *error, BOOL success))callback;

- (void) getSessions:(void (^)(NSError *error, BOOL success))callback;

- (void) getSessionById:(NSNumber*)sessionId callback:(void (^)(NSError *error, BOOL success))callback;

- (void) updateSessionId:(NSNumber*)id_session name:(NSString*)name description:(NSString*)description id_asso:(NSNumber*)id_asso dateSession:(NSDate*)dateSession salle:(NSString*)salle token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

- (void) deleteSessionWithId:(NSNumber*)id_session token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

@end
