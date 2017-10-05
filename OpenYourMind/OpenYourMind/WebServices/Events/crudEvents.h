//
//  crudEvents.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface crudEvents : NSObject {
    NSMutableArray<Event*>* eventList_;
    NSDictionary* dictError_;
    Event* event_;
}

@property (nonatomic, strong) NSMutableArray<Event*>* eventList;
@property (nonatomic, strong) Event* event;
@property (nonatomic, strong) NSDictionary* dictError;


- (void) addDescription:(NSString*)description id_asso:(NSInteger*)id_asso dateSession:(NSDate*)dateSession salle:(NSString*)salle callback:(void (^)(NSError *error, BOOL success))callback;

- (void) getEvent:(void (^)(NSError *error, BOOL success))callback;

- (void) getEventById:(NSInteger*)eventId callback:(void (^)(NSError *error, BOOL success))callback;

- (void) updateEventId:(NSInteger*)id_event description:(NSString*)description id_asso:(NSInteger*)id_asso dateSession:(NSDate*)dateSession salle:(NSString*)salle token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

- (void) deleteEventWithId:(NSInteger*)id_event token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

@end
