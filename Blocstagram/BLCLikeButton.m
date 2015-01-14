//
//  BLCLikeButton.m
//  
//
//  Created by dbk-dev on 1/12/15.
//
//


#import "BLCLikeButton.h"
#import "BLCCircleSpinnerView.h"

#define kLikedStateImage @"heart-full"
#define kUnlikedStateImage @"heart-empty"

@interface BLCLikeButton ()

@property (nonatomic, strong) BLCCircleSpinnerView *spinnerView;

@end


@implementation BLCLikeButton

- (instancetype) init {
    self = [super init];
    
    if (self) {
        self.spinnerView = [[BLCCircleSpinnerView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [self addSubview:self.spinnerView];
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
       
        // Changed this beceause it looks better on multiple lines
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        self.likeButtonState = BLCLikeStateNotLiked;
    }
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    self.spinnerView.frame = self.imageView.frame;
}

- (void) setLikeButtonState:(BLCLikeState)likeState {
    _likeButtonState = likeState;
    
    NSString *imageName;
    
    switch (_likeButtonState) {
        case BLCLikeStateLiked:
        case BLCLikeStateUnliking:
            imageName = kLikedStateImage;
            break;
            
        case BLCLikeStateNotLiked:
        case BLCLikeStateLiking:
            imageName = kUnlikedStateImage;
    }
    
    switch (_likeButtonState) {
        case BLCLikeStateLiking:
        case BLCLikeStateUnliking:
            self.spinnerView.hidden = NO;
            self.userInteractionEnabled = NO;
            break;
            
        case BLCLikeStateLiked:
        case BLCLikeStateNotLiked:
            self.spinnerView.hidden = YES;
            self.userInteractionEnabled = YES;
    }
    
    
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
