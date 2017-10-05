//
//  Type.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Type : NSObject {
    
    NSInteger id_type_;
    NSString* status_;
    
}

@property (nonatomic, assign) NSInteger id_type;
@property (nonatomic, strong) NSString* status;

- (instancetype) initWithId:(NSInteger)id_type status:(NSString*)status;

@end
