//
//  Notes.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notes : NSObject {
    
    NSInteger* id_note_;
    NSInteger* description_;
    NSInteger* id_inscrit_;
    NSInteger* id_session_;
    
}

@property (nonatomic, assign) NSInteger* id_note;
@property (nonatomic, strong) NSInteger* description;
@property (nonatomic, assign) NSInteger* id_inscrit;
@property (nonatomic, assign) NSInteger* id_session;

- (instancetype) initWithId:(NSInteger*)id_note description:(NSInteger*)description id_inscrit:(NSInteger*)id_inscrit id_session:(NSInteger*)id_session;

@end
