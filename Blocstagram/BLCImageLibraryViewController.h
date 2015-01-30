//
//  BLCImageLibraryViewController.h
//  Blocstagram
//
//  Created by dbk-dev on 1/28/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BLCImageLibraryViewController;

@protocol BLCImageLibraryViewControllerDelegate <NSObject>

- (void) imageLibraryViewController:(BLCImageLibraryViewController *)imageLibraryViewController didCompleteWithImage:(UIImage *)image;




@end

@interface BLCImageLibraryViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath;


@property (nonatomic, weak) NSObject <BLCImageLibraryViewControllerDelegate> *delegate;

@end
