//
//  Bluray.h
//  ESGI Library
//
//  Created by Etudiant on 05/10/2015.
//  Copyright © 2015 Etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bluray : NSObject {
    @private
    NSString* name_;
    NSString* genre_;
    NSDate* date_;
    NSNumber* price_;
}

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* genre;
@property (nonatomic, strong) NSDate* date;
@property (nonatomic, strong) NSNumber* price;

@end
