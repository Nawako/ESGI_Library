//
//  SerializableBlurayRepository.m
//  ESGI Library
//
//  Created by Etudiant on 05/10/2015.
//  Copyright © 2015 Etudiant. All rights reserved.
//

#import "SerializableBlurayRepository.h"

static SerializableBlurayRepository* sharedInstance_ = nil;

@implementation SerializableBlurayRepository

+ (instancetype) sharedInstance {
    if (sharedInstance_ == nil) {
        sharedInstance_ = [[SerializableBlurayRepository alloc] initWithFileName:@"bluray.archive"];
    }
    return sharedInstance_;
}

- (instancetype) initWithFileName:(NSString*) filename {
    if (self = [super init] ) {
        // Renvoi un tableau
        NSArray* documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        filepath_ = [[documentPaths objectAtIndex:0] stringByAppendingPathComponent:filename];
        blurayList_ = [NSKeyedUnarchiver unarchiveObjectWithFile:filepath_];
    }
    return self;
}

- (void) saveBluray:(Bluray*) br {
    // Vérifie que la liste est initialisé
    if (blurayList_ == nil) {
        // Créer la liste
        blurayList_ = [[NSMutableArray alloc] init];
    }
    
    NSInteger indexOf = [blurayList_ indexOfObject:br];
    // Vérifie que l'object existe
    if (indexOf != NSNotFound) {
        // Remplace si existe
        [blurayList_ replaceObjectAtIndex:indexOf withObject:br];
    }
    else {
        // Créer si nouveau
        [blurayList_ addObject:br];
    }
    // Chemin de sauvegarde avec object
    [NSKeyedArchiver archiveRootObject:blurayList_ toFile:filepath_];
    
}
- (void) deleteBluray:(Bluray*) br {
    [blurayList_ removeObject:br];
    [NSKeyedArchiver archiveRootObject:blurayList_ toFile:filepath_];
}

- (NSArray<Bluray*>*) getAll {
    return blurayList_;
}

// Cherche avec le paramètre name dans la list de Bluray grâce au foreach
- (Bluray*) searchBlurayWithName:(NSString*) name {
    for (Bluray* br in blurayList_) {
        if ([br.name isEqualToString:name]) {
            return br;
        }
    }
    return nil;
}

@end
