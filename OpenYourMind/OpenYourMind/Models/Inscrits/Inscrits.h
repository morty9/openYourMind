//
//  Inscrits.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Inscrits : NSObject {
    
    NSInteger id_inscrit_;
    NSInteger id_user_;
    NSInteger id_session_;
    BOOL status_;
    
}

@property (nonatomic, assign) NSInteger id_inscrit;
@property (nonatomic, assign) NSInteger id_user;
@property (nonatomic, assign) NSInteger id_session;
@property (nonatomic, assign) BOOL status;

- (instancetype) initWithId:(NSInteger)id_inscrit id_user:(NSInteger)id_user id_session:(NSInteger)id_session status:(BOOL)status;

@end
