//
//  BLCMediaTableViewCellTest.m
//  Blocstagram
//
//  Created by dbk-dev on 2/6/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BLCMediaTableViewCell.h"
#import "BLCMedia.h"


@interface BLCMediaTableViewCellTest : XCTestCase

@end

@implementation BLCMediaTableViewCellTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
- (void)testThatHeightReturnsCorrectly
{
    
    NSMutableArray *images  = [NSMutableArray array];
    
    for (int i = 1; i <= 10; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            [images addObject:image];
        }
        
        // For this to work:
        
        // a) Have to send BLCMedia an image through the "Dictionary" to create the BLCMediaObject
        
        NSDictionary *imageDictionary = @{@"image": images[0] };
        BLCMedia *mediaItem = [[BLCMedia alloc]initWithDictionary:imageDictionary];
    
    
       // CGFloat newImageHeight = [BLCMediaTableViewCell heightForMediaItem:mediaItem width:320];
    
    
    XCTAssertEqual([BLCMediaTableViewCell heightForMediaItem:mediaItem width:300], 300);
    XCTAssertEqual([BLCMediaTableViewCell heightForMediaItem:mediaItem width:200], 200);
    
       
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    NSMutableArray *images  = [NSMutableArray array];
//    
//    for (int i = 1; i <= 10; i++) {
//        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i];
//        UIImage *image = [UIImage imageNamed:imageName];
//        if (image) {
//            [images addObject:image];
//        }
//        
//        NSDictionary *imageDictionary = @{@"image": images[0]};
//        
//        BLCMedia *mediaItem = [[BLCMedia alloc]init];
//        
//        [mediaItem initWithDictionary:imageDictionary];
//        CGFloat newImageSize =[BLCMediaTableViewCell heightForMediaItem:mediaItem width:320];
//        XCTAssertTrue(newImageSize == CGRectGetHeight(height.frame) , @"the height is incorrect");
//        
//        
    }
        
    }
    - (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
