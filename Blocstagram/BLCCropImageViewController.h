//
//  BLCCropImageViewController.h
//  Blocstagram
//
//  Created by dbk-dev on 1/28/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLCMediaFullScreenViewController.h"


@class BLCCropImageViewController;

@protocol BLCCropImageViewControllerDelegate <NSObject>

- (void) cropControllerFinishedWithImage:(UIImage *)croppedImage;

@end

@interface BLCCropImageViewController : BLCMediaFullScreenViewController

- (instancetype) initWithImage:(UIImage *)sourceImage;

@property (nonatomic, weak) NSObject <BLCCropImageViewControllerDelegate> *delegate;

@end