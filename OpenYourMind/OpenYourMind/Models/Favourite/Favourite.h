//
//  Favourite.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Favourite : NSObject {
    
    NSInteger* id_favourite_;
    NSInteger* id_user_;
    NSInteger* id_asso_;
    
}

@property (nonatomic, assign) NSInteger* id_favourite;
@property (nonatomic, assign) NSInteger* id_user;
@property (nonatomic, assign) NSInteger* id_asso;

- (instancetype) initWithId:(NSInteger*)id_favourite id_user:(NSInteger*)id_user id_asso:(NSInteger*)id_asso;

@end
