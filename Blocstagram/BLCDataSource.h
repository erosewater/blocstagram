//
//  BLCDataSource.h
//  Blocstagram
//
//  Created by dbk-dev on 12/10/14.
//  Copyright (c) 2014 Bloc. All rights reserved.
//

#import <Foundation/Foundation.h>





// dbk ask Steve what the difference between @class and import is
@class BLCMedia;

typedef void (^BLCNewItemCompletionBlock)(NSError *error);

@interface BLCDataSource : NSObject
extern NSString *const BLCImageFinishedNotification;


+(instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSArray *mediaItems;
@property (nonatomic, strong, readonly) NSString *accessToken;





- (void) deleteMediaItem:(BLCMedia *)item;
- (void) requestNewItemsWithCompletionHandler:(BLCNewItemCompletionBlock)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(BLCNewItemCompletionBlock)completionHandler;
- (void) downloadImageForMediaItem:(BLCMedia *)mediaItem;
- (void) toggleLikeOnMediaItem:(BLCMedia *)mediaItem;
- (void) commentOnMediaItem:(BLCMedia *)mediaItem withCommentText:(NSString *)commentText;


+ (NSString *) instagramClientID;

@end
