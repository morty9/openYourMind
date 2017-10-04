//
//  Schools.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 04/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Schools : NSObject {
    
    NSInteger schoolId_;
    NSString* name_;
    
}

@property (nonatomic, assign) NSInteger schoolId;
@property (nonatomic, strong) NSString* name;

- (instancetype) initWithId:(NSInteger)schoolId name:(NSString*)name;

@end
