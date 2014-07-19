//
//  Product.h
//  Mappers
//
//  Created by Taras Kalapun on 18/07/14.
//  Copyright (c) 2014 Kalapun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ProductProperties <NSObject, JSExport>

@property (nonatomic, strong) NSNumber* categoryId;
@property (nonatomic, strong) NSString* detail;
@property (nonatomic, strong) NSDictionary* extraInfo;
@property (nonatomic, strong) NSString* identifier;
@property (nonatomic, strong) NSString* mediaUrl;
@property (nonatomic, strong) NSString* model;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) BOOL onSale;
@property (nonatomic, strong) NSString* shelf;
@property (nonatomic, assign) NSInteger unitQuantity;

@property (nonatomic, strong) NSDictionary *defaultSku;
@property (nonatomic, strong) NSArray *skus;

@property (nonatomic, strong) NSArray *ingredients;
@property (nonatomic, strong) NSArray *nutritions;
@property (nonatomic, strong) NSArray *allergens;

//+ (NSDictionary *)JSONKeyPathsByPropertyKey;

+ (instancetype)new;

@end

@interface Product : NSObject <ProductProperties>

@end
