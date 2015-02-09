//
//  BLCMediaTests.m
//  Blocstagram
//
//  Created by dbk-dev on 2/5/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BLCMedia.h"

@interface BLCMediaTests : XCTestCase

@end

@implementation BLCMediaTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatMediaInitializationWorks
{
   
    NSDictionary *captionDictionary = @{@"text":@"Jenny"};
    NSDictionary *imageURLDictionary =@{@"url": @"http://www.expedia.com"};
    NSDictionary *resolutionDictionary = @{@"standard_resolution": imageURLDictionary};
    
    
    NSDictionary *sourceDictionary = @{@"id": @"8675309",
                                       @"caption": captionDictionary,
                                       @"images": resolutionDictionary};
    
    
    
    BLCMedia *testMedia = [[BLCMedia alloc] initWithDictionary:sourceDictionary];
    
    XCTAssertEqualObjects(testMedia.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertEqualObjects(testMedia.caption, sourceDictionary[@"caption"][@"text"], @"The caption should be equal");
    XCTAssertEqualObjects(testMedia.mediaURL, [NSURL URLWithString:sourceDictionary[@"images"][@"standard_resolution"][@"url"]], @"The URL should be equal");
    
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
