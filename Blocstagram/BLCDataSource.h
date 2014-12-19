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
@interface BLCDataSource : NSObject

+(instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSArray *mediaItems;

// Do we still need the first one
- (void) removeMediaItemAtIndex:(NSUInteger)index;
- (void) deleteMediaItem:(BLCMedia *)item;

@end
