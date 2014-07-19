//
//  JSONParsingBenchmarkTestCase.m
//  Mappers
//
//  Created by Taras Kalapun on 09/04/14.
//  Copyright (c) 2014 Kalapun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <JavaScriptCore/JavaScriptCore.h>

#import "ProductModels.h"

@interface JSMapperTest : XCTestCase

@end

@implementation JSMapperTest

static NSData *jsonData;
static NSString *jsonString;
static NSDictionary *jsonDict;
static JSContext *context;
static int nums = 10000;

+ (void)load {
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"product" ofType:@"json"];
    jsonData = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    context = [[JSContext alloc] init];
    [context evaluateScript:@"function parser(str){ return JSON.parse(str); }"];
    
    [context evaluateScript:@"var console = {}"];
    context[@"console"][@"log"] = ^(NSString *msg) {
        NSLog(@"JS: %@", msg);
    };
    
    for (NSString *file in @[@"mapper"]) {
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:file ofType:@"js"];
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
        if (content) {
            [context evaluateScript:content];
        }
    }
    
    context[@"Product"] = Product.class;
}


- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}


- (void)testPerformanceOCParser {
    [self measureBlock:^{
        for (int i=0; i<nums; i++) {
            NSError *error = nil;
            NSDictionary *parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
            XCTAssertNotNil(parsedData, @"Should not be nil");
        }
    }];
}

- (void)testPerformanceJSParser {
    [self measureBlock:^{
        for (int i=0; i<nums; i++) {
            JSValue *func = context[@"parser"];
            JSValue *res = [func callWithArguments:@[jsonString]];
            NSDictionary *parsedData = [res toDictionary];
            XCTAssertNotNil(parsedData[@"name"], @"Should not be nil");
        }
    }];
}


- (void)testPerformanceJS
{
    [self measureBlock:^{
        JSValue *func = context[@"mapJSON2Object1"];
        JSValue *res = [func callWithArguments:@[jsonString, @"Product", [Product JSONKeyPathsByPropertyKey]]];
        Product *product = [res toObject];
        
        XCTAssertNotNil(product.name, @"Should not be nil");
    }];
}


@end
