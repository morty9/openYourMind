//
//  Favourite.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Favourite : NSObject {
    
    NSNumber* id_favourite_;
    NSNumber* id_user_;
    NSNumber* id_asso_;
    
}

@property (nonatomic, assign) NSNumber* id_favourite;
@property (nonatomic, assign) NSNumber* id_user;
@property (nonatomic, assign) NSNumber* id_asso;

- (instancetype) initWithId:(NSNumber*)id_favourite id_user:(NSNumber*)id_user id_asso:(NSNumber*)id_asso;

@end
