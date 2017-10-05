//
//  crudUsers.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Notes.h"

@interface crudNotes : NSObject {
    NSMutableArray<Notes*>* noteList_;
    NSDictionary* dictError_;
    Notes* notes_;
}

@property (nonatomic, strong) NSMutableArray<Notes*>* noteList;
@property (nonatomic, strong) Notes* note;
@property (nonatomic, strong) NSDictionary* dictError;


- (void) addDescription:(NSNumber*)description id_inscrit:(NSNumber*)id_inscrit id_session:(NSNumber*)id_session callback:(void (^)(NSError *error, BOOL success))callback;

- (void) getNotes:(void (^)(NSError *error, BOOL success))callback;

- (void) getNoteById:(NSNumber*)noteId callback:(void (^)(NSError *error, BOOL success))callback;

- (void) updateNoteId:(NSNumber*)id_note description:(NSNumber*)description id_inscrit:(NSNumber*)id_inscrit id_session:(NSNumber*)id_session token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

- (void) deleteNoteWithId:(NSNumber*)id_note token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

@end

