//
//  ProductFEM.h
//  iJSPlayground
//
//  Created by Taras Kalapun on 18/07/14.
//  Copyright (c) 2014 Kalapun. All rights reserved.
//

#import "Product.h"
#import <FastEasyMapping.h>

@interface Product (FEM)

+ (NSDictionary *)JSONKeyPathsByPropertyKey;
+ (FEMObjectMapping *)mapping;

@end
