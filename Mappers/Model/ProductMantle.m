//
//  ProductMantle.m
//  Mappers
//
//  Created by Taras Kalapun on 18/07/14.
//  Copyright (c) 2014 Kalapun. All rights reserved.
//

#import "ProductMantle.h"

@implementation ProductMantle
@synthesize name,extraInfo,allergens,categoryId,detail,identifier,ingredients,mediaUrl,model,nutritions,onSale,shelf,unitQuantity,skus;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identifier": @"id",
             @"detail": @"description",
             @"unitQuantity": @"unit_quantity",
             };
}

+ (NSValueTransformer *)identifierJSONTransformer {
    return [MTLValueTransformer transformerWithBlock:^id(id x) {
        return [x stringValue];
    }];
}

+ (NSValueTransformer *)categoryIdJSONTransformer {
    return [MTLValueTransformer transformerWithBlock:^id(id x) {
        return @([x floatValue]);
    }];
}

@end
