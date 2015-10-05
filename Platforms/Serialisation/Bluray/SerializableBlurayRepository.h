//
//  SerializableBlurayRepository.h
//  ESGI Library
//
//  Created by Etudiant on 05/10/2015.
//  Copyright © 2015 Etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IBlurayRepository.h"


@interface SerializableBlurayRepository : NSObject<IBlurayRepository> {
    @private
    NSString* filepath_;
    NSMutableArray<Bluray*>* blurayList_;
}

+ (instancetype) sharedInstance;

// instancetype = type de l'instance dynamique
- (instancetype) initWithFileName:(NSString*) filename;

@end
