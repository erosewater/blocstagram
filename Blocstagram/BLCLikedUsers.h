//
//  BLCLikedUsers.h
//  Blocstagram
//
//  Created by dbk-dev on 1/12/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

// This class is not used

#import <Foundation/Foundation.h>

@class BLCUser;


@interface BLCLikedUsers : NSObject


//@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) BLCUser *username;
@property (nonatomic, strong) NSNumber *count;


- (instancetype) initWithDictionary:(NSDictionary *)likedUserDictionary;


@end
