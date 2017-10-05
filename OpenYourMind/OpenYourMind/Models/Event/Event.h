//
//  Event.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject {
    
    NSNumber* id_event_;
    NSString* description_;
    NSDate* date_;
    NSString* salle_;
    NSNumber* id_asso_;
}

@property (nonatomic, assign) NSNumber* id_event;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, strong) NSDate* date;
@property (nonatomic, assign) NSNumber* id_asso;
@property (nonatomic, strong) NSString* salle;

- (instancetype) initWithId:(NSNumber*)id_event description:(NSString*)description date:(NSDate*)date salle:(NSString*)salle id_asso:(NSNumber*)id_asso;

@end
