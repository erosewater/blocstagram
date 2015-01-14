//
//  BLCLikedUsers.m
//  Blocstagram
//
//  Created by dbk-dev on 1/12/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

// This class is not used

#import "BLCLikedUsers.h"
#import "BLCUser.h"

@implementation BLCLikedUsers



- (instancetype) initWithDictionary:(NSDictionary *)likedUserDictionary {
    self = [super init];
    
    if (self) {
        self.count = likedUserDictionary[@"count"];
       // self.username = likedUserDictionary[@"username"];
        
    }
    
    return self;
}

#pragma mark - NSCoding

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.count = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(count))];
       
        
    }
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.count forKey:NSStringFromSelector(@selector(count))];
//    [aCoder encodeObject:self.username forKey:NSStringFromSelector(@selector(username))];
    
}

//+ (NSNumber)countLikedUsers:(NSDictionary *)likedUserDictionary {
//    return likedUserDictionary.count;
//}

@end



