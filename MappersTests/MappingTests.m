//
//  MappingTests.m
//  Mappers
//
//  Created by Taras Kalapun on 18/07/14.
//  Copyright (c) 2014 Kalapun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ProductModels.h"

@interface MappingTests : XCTestCase

@end

@implementation MappingTests

static NSDictionary *jsonDict;
static int nums = 10000;

+ (void)load {
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"product" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
}

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)dumpProduct:(id<ProductProperties>)product {
    NSLog(@"#%@: %@, skus: %@", product.identifier, product.name, product.skus);
}

- (void)assertProduct:(id<ProductProperties>)product {
    XCTAssertNotNil(product.name, @"Product should be");
    XCTAssertTrue([product.identifier isKindOfClass:NSString.class], "identifier should be string");
    XCTAssertTrue([product.categoryId isKindOfClass:NSNumber.class], "categoryId should be number");
    XCTAssertTrue((product.unitQuantity > 0), "unitQuantity should be set");
    
    XCTAssertNotNil(product.defaultSku, "D-Sku should be set");
    
    NSString *dskuName = [product.defaultSku objectForKey:@"name"];
    XCTAssertNotNil(dskuName, "Skus should be set");
    
    NSArray *skus = product.skus;
    XCTAssertTrue((skus.count > 0), "unitQuantity should be set");
    NSString *skuName = [skus[0] objectForKey:@"name"];
    XCTAssertNotNil(skuName, "Skus should be set");
    //[self dumpProduct:product];
}

#pragma mark - Test libs

- (void)testMantle {
    NSError *error = nil;
    ProductMantle *product = [MTLJSONAdapter modelOfClass:[ProductMantle class] fromJSONDictionary:jsonDict error:&error];
    [self assertProduct:product];
}

- (void)testIsaak {
    ProductIsaac *product = [jsonDict isc_objectFromJSONWithClass:ProductIsaac.class];
    [self assertProduct:product];
}

- (void)testFEM {
    Product *product = [FEMObjectDeserializer deserializeObjectExternalRepresentation:jsonDict usingMapping:[Product mapping]];
    [self assertProduct:product];
}

#pragma mark - Test Performance

- (void)testPerformanceMantle1 {
    [self measureBlock:^{
        for (int i=0; i<nums; i++) {
            NSError *error = nil;
            ProductMantle *product = [MTLJSONAdapter modelOfClass:[ProductMantle class] fromJSONDictionary:jsonDict error:&error];
        }
    }];
}

- (void)testPerformanceIsaak1 {
    [self measureBlock:^{
        for (int i=0; i<nums; i++) {
            ProductIsaac *product = [jsonDict isc_objectFromJSONWithClass:ProductIsaac.class];
        }
    }];
}

- (void)testPerformanceFEM1 {
    [self measureBlock:^{
        for (int i=0; i<nums; i++) {
            Product *product = [FEMObjectDeserializer deserializeObjectExternalRepresentation:jsonDict usingMapping:[Product mapping]];
        }
    }];
}


@end
