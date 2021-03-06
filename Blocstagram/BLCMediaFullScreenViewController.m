//
//  BLCMediaFullScreenVIewController.m
//  Blocstagram
//
//  Created by dbk-dev on 1/2/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "BLCMediaFullScreenViewController.h"
#import "BLCMedia.h"
#import "BLCImagesTableViewController.h"

// MediaTableViewDelegate refererence ImagesTableViewController where didShareMedia method lives
@interface BLCMediaFullScreenViewController () <UIScrollViewDelegate>


@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) UITapGestureRecognizer *doubleTap;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UITapGestureRecognizer *tapBehind;




@end


@implementation BLCMediaFullScreenViewController

- (instancetype) initWithMedia:(BLCMedia *)media {
    self = [super init];
    
    if (self) {
        self.media = media;
       
       
        
        
    }
    
    return self;
}




- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [UIScrollView new];
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    
    self.imageView = [UIImageView new];
    self.imageView.image = self.media.image;
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.media.image.size;
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFired:)];
    
    self.doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapFired:)];
    self.doubleTap.numberOfTapsRequired = 2;
    
    [self.tap requireGestureRecognizerToFail:self.doubleTap];
    
    if (isPhone == NO) {
        self.tapBehind = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBehindFired:)];
        self.tapBehind.cancelsTouchesInView = NO;
    }
    

    
    [self.scrollView addGestureRecognizer:self.tap];
    [self.scrollView addGestureRecognizer:self.doubleTap];
    
    
    
    // Add ShareButton
    self.shareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.shareButton setEnabled:YES];
    [self.shareButton setTitle:NSLocalizedString(@"Share", @"Share Button") forState:UIControlStateNormal];
    [self.shareButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat viewWidth = screenRect.size.width;
    self.shareButton.frame = CGRectMake(viewWidth - 57, 5, 57, 57);

    [self.view addSubview:self.shareButton];
    
    
          
      }
    



- (void)  didShare:(id)sender {
    
  // This function works - Need to work on using delegate method
    
      NSMutableArray *itemsToShare = [NSMutableArray array];
      [itemsToShare addObject:self.media.image];
   
   
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    [self presentViewController:activityVC animated:YES completion:nil];
    


}

// Delegate Method doesn't work

-(void) buttonPressed:(id)sender {
   if ([self.fullScreenDelegate respondsToSelector:@selector(didShareMedia:fromController:)]) {
       [self.fullScreenDelegate didShareMedia:self.media fromController:self];
       
   }
    
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.scrollView.frame = self.view.bounds;
    
    [self recalculateZoomScale];
}

- (void) recalculateZoomScale {
    
    CGSize scrollViewFrameSize = self.scrollView.frame.size;
    CGSize scrollViewContentSize = self.scrollView.contentSize;
    
    scrollViewContentSize.height /= self.scrollView.zoomScale;
    scrollViewContentSize.width /= self.scrollView.zoomScale;
    
    CGFloat scaleWidth = scrollViewFrameSize.width / scrollViewContentSize.width;
    CGFloat scaleHeight = scrollViewFrameSize.height / scrollViewContentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    // experimented with a zoom factor of 3, was too big.
    self.scrollView.minimumZoomScale = minScale;
    self.scrollView.maximumZoomScale = 1;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat viewWidth = screenRect.size.width;
    self.shareButton.frame = CGRectMake(viewWidth - 57, 5, 57, 57);
    
    
 
    
}

- (void)centerScrollView {
    [self.imageView sizeToFit];
    
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - CGRectGetWidth(contentsFrame)) / 2;
    } else {
        contentsFrame.origin.x = 0;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - CGRectGetHeight(contentsFrame)) / 2;
    } else {
        contentsFrame.origin.y = 0;
    }
    
    self.imageView.frame = contentsFrame;
}

#pragma mark - Gesture Recognizers

- (void) tapFired:(UITapGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) doubleTapFired:(UITapGestureRecognizer *)sender {
    if (self.scrollView.zoomScale == self.scrollView.minimumZoomScale) {
        CGPoint locationPoint = [sender locationInView:self.imageView];
        
        CGSize scrollViewSize = self.scrollView.bounds.size;
        
        CGFloat width = scrollViewSize.width / self.scrollView.maximumZoomScale;
        CGFloat height = scrollViewSize.height / self.scrollView.maximumZoomScale;
        CGFloat x = locationPoint.x - (width / 2);
        CGFloat y = locationPoint.y - (height / 2);
        
        [self.scrollView zoomToRect:CGRectMake(x, y, width, height) animated:YES];
    } else {
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale animated:YES];
    }
}


#pragma mark - UIScrollViewDelegate

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self centerScrollView];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self centerScrollView];
    
    
    if (isPhone == NO) {
        [[[[UIApplication sharedApplication] delegate] window] addGestureRecognizer:self.tapBehind];
    }

}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (isPhone == NO) {
        [[[[UIApplication sharedApplication] delegate] window] removeGestureRecognizer:self.tapBehind];
    }
}

- (void) tapBehindFired:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint location = [sender locationInView:nil]; // Passing nil gives us coordinates in the window
        CGPoint locationInVC = [self.presentedViewController.view convertPoint:location fromView:self.view.window];
        
        if ([self.presentedViewController.view pointInside:locationInVC withEvent:nil] == NO) {
            // The tap was outside the VC's view
            
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
}

@end