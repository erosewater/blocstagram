//
//  BLCMediaFullScreenVIewController.h
//  Blocstagram
//
//  Created by dbk-dev on 1/2/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLCImagesTableViewController.h"

@class BLCMedia;
@protocol BLCMediaFullScreenDelegate <NSObject>

@optional
-(void)didShareMedia:(BLCMedia *)item fromController:(UIViewController *)controller;

@end

@interface BLCMediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, weak) id <BLCMediaFullScreenDelegate> fullScreenDelegate;


- (instancetype) initWithMedia:(BLCMedia *)media;


- (void) centerScrollView;

@end
