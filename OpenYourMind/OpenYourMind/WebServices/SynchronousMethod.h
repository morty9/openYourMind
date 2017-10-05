//
//  SynchronousMethod.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SynchronousMethod : NSObject

- (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(__autoreleasing NSURLResponse **)responsePtr error:(__autoreleasing NSError **)errorPtr;

@end
