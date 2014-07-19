//
//  ProductFEM.m
//  Mappers
//
//  Created by Taras Kalapun on 18/07/14.
//  Copyright (c) 2014 Kalapun. All rights reserved.
//

#import "ProductFEM.h"

@implementation Product (FEM)

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"identifier": @"id",
             @"detail": @"description",
             @"unitQuantity": @"unit_quantity",
             };
}

+ (FEMObjectMapping *)mapping
{
    return [FEMObjectMapping mappingForClass:Product.class configuration:^(FEMObjectMapping *mapping) {
        [mapping addAttributeMappingFromArray:@[@"name", @"skus", @"categoryId", @"defaultSku"]];
        [mapping addAttributeMappingDictionary:[self JSONKeyPathsByPropertyKey]];
    }];
}

@end
