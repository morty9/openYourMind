//
//  Schools.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Schools : NSObject {
    
    NSNumber* id_school_;
    NSString* name_;
    
}

@property (nonatomic, assign) NSNumber* id_school;
@property (nonatomic, strong) NSString* name;

- (instancetype) initWithId:(NSNumber*)id_school name:(NSString*)name;

@end
