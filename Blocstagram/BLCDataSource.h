//
//  BLCDataSource.h
//  Blocstagram
//
//  Created by dbk-dev on 12/10/14.
//  Copyright (c) 2014 Bloc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLCDataSource : NSObject

+(instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSMutableArray *mediaItems;

@end
