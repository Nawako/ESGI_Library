//
//  IBlurayRepository.h
//  ESGI Library
//
//  Created by Etudiant on 05/10/2015.
//  Copyright © 2015 Etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bluray.h"

@protocol IBlurayRepository <NSObject>

@required

- (void) saveBluray:(Bluray*) br;
- (void) deleteBluray:(Bluray*) br;
- (NSArray<Bluray*>*) getAll;
- (Bluray*) searchBlurayWithName:(NSString*) name;

@end
