//
//  Role.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Role : NSObject {
    
    NSInteger* id_role_;
    NSString* name_;
    
}

@property (nonatomic, assign) NSInteger* id_role;
@property (nonatomic, strong) NSString* name;

- (instancetype) initWithId:(NSInteger*)id_role name:(NSString*)name;

@end
