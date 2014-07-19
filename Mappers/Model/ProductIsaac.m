//
//  ProductIsaac.m
//  Mappers
//
//  Created by Taras Kalapun on 18/07/14.
//  Copyright (c) 2014 Kalapun. All rights reserved.
//

#import "ProductIsaac.h"

@implementation ProductIsaac

/*
 @"identifier": @"id",
 @"detail": @"description",
 @"unitQuantity": @"unit_quantity",
 */

- (NSString *)isc_keyForJSONKey:(NSString *)jsonKey {
    
    NSDictionary *d = @{
                        @"id": @"identifier",
                        @"description": @"detail",
                        @"unit_quantity": @"unitQuantity",
                        };
    
    if (d[jsonKey]) {
        return d[jsonKey];
    }
    
    return [super isc_keyForJSONKey:jsonKey];
}

//- (Class)isc_classForObject:(id)object inArrayWithKey:(NSString *)key {
//    return [NSDictionary class];
//}

@end
