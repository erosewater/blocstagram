//
//  BLCCameraToolbar.h
//  Blocstagram
//
//  Created by dbk-dev on 1/25/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BLCCameraToolbar;

@protocol BLCCameraToolbarDelegate <NSObject>

- (void) leftButtonPressedOnToolbar:(BLCCameraToolbar *)toolbar;
- (void) rightButtonPressedOnToolbar:(BLCCameraToolbar *)toolbar;
- (void) cameraButtonPressedOnToolbar:(BLCCameraToolbar *)toolbar;

@end

@interface BLCCameraToolbar : UIView

- (instancetype) initWithImageNames:(NSArray *)imageNames;

@property (nonatomic, weak) NSObject <BLCCameraToolbarDelegate> *delegate;

@end



