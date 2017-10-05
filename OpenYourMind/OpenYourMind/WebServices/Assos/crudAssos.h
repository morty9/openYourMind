//
//  crudAssos.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Assos.h"

@interface crudAssos : NSObject {
    
    NSMutableArray<Assos*>* assoList_;
    NSDictionary* dictError_;
    Assos* asso_;
    
}

@property (nonatomic, strong) NSMutableArray<Assos*>* assoList;
@property (nonatomic, strong) Assos* asso;
@property (nonatomic, strong) NSDictionary* dictError;

- (void) addName:(NSString*)name id_school:(NSNumber*)id_school description:(NSString*)description id_user:(NSNumber*)id_user id_type:(NSNumber*)id_type callback:(void (^)(NSError *error, BOOL success))callback;

- (void) getAssos:(void (^)(NSError *error, BOOL success))callback;

- (void) getAssoById:(NSNumber*)userId callback:(void (^)(NSError *error, BOOL success))callback;

- (void) updateAssoId:(NSNumber*)id_asso id_school:(NSNumber*)id_school name:(NSString*)name description:(NSString*)description id_user:(NSNumber*)password id_type:(NSNumber*)id_type token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

- (void) deleteAssoWithId:(NSNumber*)id_asso token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

@end

