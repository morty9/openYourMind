//
//  crudFavourit.h
//  OpenYourMind
//
//  Created by nico on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Favourite.h"

@interface crudFavourit : NSObject {
    NSMutableArray<Favourite*>* favouriteList_;
    NSDictionary* dictError_;
    Favourite* user_;
}

@property (nonatomic, strong) NSMutableArray<Favourite*>* favouriteList;
@property (nonatomic, strong) Favourite* favourite;
@property (nonatomic, strong) NSDictionary* dictError;


- (void) addId_user:(NSNumber*)id_user id_asso:(NSNumber*)id_asso callback:(void (^)(NSError *error, BOOL success))callback;

- (void) getFavourite:(void (^)(NSError *error, BOOL success))callback;

- (void) getFavouriteById:(NSNumber*)favouriteId callback:(void (^)(NSError *error, BOOL success))callback;

- (void) updateFavouriteId:(NSNumber*)id_favourite id_user:(NSNumber*)id_user id_asso:(NSNumber*)id_asso token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

- (void) deleteFavouriteWithId:(NSNumber*)id_favourite token:(NSString*)token callback:(void (^)(NSError *error, BOOL success))callback;

@end

