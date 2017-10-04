//
//  Type.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Type : NSObject {
    
    NSInteger typeId_;
    NSString* type_;
    
}

@property (nonatomic, assign) NSInteger typeId;
@property (nonatomic, strong) NSString* type;

- (instancetype) initWithId:(NSInteger)typeId type:(NSString*)type;

@end
