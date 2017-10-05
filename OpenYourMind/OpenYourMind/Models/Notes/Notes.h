//
//  Notes.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notes : NSObject {
    
    NSNumber* id_note_;
    NSNumber* description_;
    NSNumber* id_inscrit_;
    NSNumber* id_session_;
    
}

@property (nonatomic, strong) NSNumber* id_note;
@property (nonatomic, strong) NSNumber* description;
@property (nonatomic, strong) NSNumber* id_inscrit;
@property (nonatomic, strong) NSNumber* id_session;

- (instancetype) initWithId:(NSNumber*)id_note description:(NSNumber*)description id_inscrit:(NSNumber*)id_inscrit id_session:(NSNumber*)id_session;

@end
