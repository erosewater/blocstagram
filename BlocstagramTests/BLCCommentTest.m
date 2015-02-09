//
//  BLCCommentTest.m
//  Blocstagram
//
//  Created by dbk-dev on 2/5/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BLCComposeCommentView.h"

@interface BLCCommentTest : XCTestCase

@end

@implementation BLCCommentTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCommentWritingWorks
{
    
    BLCComposeCommentView *writeComment = [[BLCComposeCommentView alloc]init];
    writeComment.text = @"The lazy brown dog";
    XCTAssertTrue(writeComment.isWritingComment == YES, @"The is an error in comment section");
}

-(void)testThatNoCommentIsWriting
{   BLCComposeCommentView *writeComment = [[BLCComposeCommentView alloc]init];
    writeComment.text = nil;
    XCTAssertTrue(writeComment.isWritingComment == NO, @"The is an error in comment section");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
