//
//  ProductMantle.h
//  Mappers
//
//  Created by Taras Kalapun on 18/07/14.
//  Copyright (c) 2014 Kalapun. All rights reserved.
//

#import "Product.h"
#import <Mantle.h>


@interface ProductMantle : MTLModel <ProductProperties, MTLJSONSerializing>

@end
