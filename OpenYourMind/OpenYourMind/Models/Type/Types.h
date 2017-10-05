//
//  Types.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Types : NSObject {
    
    NSInteger* id_type_;
    NSString* status_;
    
}

@property (nonatomic, assign) NSInteger* id_type;
@property (nonatomic, strong) NSString* status;

- (instancetype) initWithId:(NSInteger*)id_type status:(NSString*)status;

@end
