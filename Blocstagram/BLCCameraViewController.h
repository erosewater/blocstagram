//
//  BLCCameraViewController.h
//  Blocstagram
//
//  Created by dbk-dev on 1/25/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "UIImage+BLCImageUtilities.h"

@class BLCCameraViewController;

@protocol BLCCameraViewControllerDelegate <NSObject>

- (void) cameraViewController:(BLCCameraViewController *)cameraViewController didCompleteWithImage:(UIImage *)image;

@end


@interface BLCCameraViewController : UIViewController


@property (nonatomic, weak) NSObject <BLCCameraViewControllerDelegate> *delegate;


@end
