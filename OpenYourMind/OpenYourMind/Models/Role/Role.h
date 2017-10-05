//
//  Role.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Role : NSObject {
    
    NSNumber* id_role_;
    NSString* name_;
    
}

@property (nonatomic, strong) NSNumber* id_role;
@property (nonatomic, strong) NSString* name;

- (instancetype) initWithId:(NSNumber*)id_role name:(NSString*)name;

@end
