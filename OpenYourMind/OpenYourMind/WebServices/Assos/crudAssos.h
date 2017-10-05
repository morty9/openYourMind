//
//  crudAssos.h
//  OpenYourMind
//
//  Created by Bérangère La Touche on 05/10/2017.
//  Copyright © 2017 Bérangère La Touche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Assos.h"

@interface crudAssos : NSObject {
    
    NSMutableArray<Assos*>* assoList_;
    NSDictionary* dictError_;
    Assos* asso_;
    
}

@property (nonatomic, strong) NSMutableArray<Assos*>* assoList;
@property (nonatomic, strong) Assos* asso;
@property (nonatomic, strong) NSDictionary* dictError;

@end
