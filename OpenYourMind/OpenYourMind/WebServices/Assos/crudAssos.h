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

- (void) addName:(NSString*)name id_school:(NSInteger*)id_school description:(NSString*)description id_user:(NSInteger*)id_user id_type:(NSInteger*)id_type callback:(void (^)(NSError *error, BOOL success))callback;

- (void) getAssos:(void (^)(NSError *error, BOOL success))callback;

- (void) getAssoById:(NSInteger*)userId callback:(void (^)(NSError *error, BOOL success))callback;

- (void) updateAssoId:(NSInteger*)id_asso id_school:(NSInteger*)id_school name:(NSString*)name description:(NSString*)description id_user:(NSInteger*)password id_type:(NSInteger*)id_type token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

- (void) deleteAssoWithId:(NSInteger*)id_asso token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

@end

