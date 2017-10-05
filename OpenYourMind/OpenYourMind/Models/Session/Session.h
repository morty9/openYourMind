//
//  Session.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Session : NSObject {
    
    NSInteger* id_session_;
    NSString* description_;
    NSDate* date_;
    NSString* salle_;
    NSInteger* id_asso_;
}

@property (nonatomic, assign) NSInteger* id_session;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, strong) NSDate* date;
@property (nonatomic, assign) NSInteger* id_asso;
@property (nonatomic, strong) NSString* salle;

- (instancetype) initWithId:(NSInteger*)id_session description:(NSString*)description date:(NSDate*)date salle:(NSString*)salle id_asso:(NSInteger*)id_asso;

@end
