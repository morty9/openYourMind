//
//  crudInscrit.h
//  OpenYourMind
//
//  Created by nico on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Inscrits.h"

@interface crudInscrit : NSObject {
    NSMutableArray<Inscrits*>* inscritList_;
    NSDictionary* dictError_;
    Inscrits* inscrits_;
}

@property (nonatomic, strong) NSMutableArray<Inscrits*>* inscritList;
@property (nonatomic, strong) Inscrits* inscrit;
@property (nonatomic, strong) NSDictionary* dictError;


- (void) addId_user:(NSNumber*)id_user id_session:(NSNumber*)id_session status:(BOOL)status callback:(void (^)(NSError *error, BOOL success))callback;

- (void) getInscrit:(void (^)(NSError *error, BOOL success))callback;

- (void) getInscritById:(NSNumber*)InscritId callback:(void (^)(NSError *error, BOOL success))callback;

- (void) updateInscritId:(NSNumber*)id_inscrit id_user:(NSNumber*)id_user id_session:(NSNumber*)id_session status:(BOOL)status token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

- (void) deleteInscritWithId:(NSNumber*)id_inscrit token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

@end
