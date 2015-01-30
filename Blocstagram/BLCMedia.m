//
//  BLCMedia.m
//  Blocstagram
//
//  Created by dbk-dev on 12/10/14.
//  Copyright (c) 2014 Bloc. All rights reserved.
//

#import "BLCMedia.h"
#import "BLCUser.h"
#import "BLCComment.h"


@implementation BLCMedia


- (instancetype) initWithDictionary:(NSDictionary *)mediaDictionary {
    self = [super init];
    
    if (self) {
        self.idNumber = mediaDictionary[@"id"];
        self.user = [[BLCUser alloc] initWithDictionary:mediaDictionary[@"user"]];
        NSString *standardResolutionImageURLString = mediaDictionary[@"images"][@"standard_resolution"][@"url"];
        NSURL *standardResolutionImageURL = [NSURL URLWithString:standardResolutionImageURLString];
        
        if (standardResolutionImageURL) {
            self.mediaURL = standardResolutionImageURL;
            self.downloadState = BLCMediaDownloadStateNeedsImage;
        } else {
            self.downloadState = BLCMediaDownloadStateNonRecoverableError;
        }
        
        NSDictionary *captionDictionary = mediaDictionary[@"caption"];
        
        // Caption might be null (if there's no caption)
        if ([captionDictionary isKindOfClass:[NSDictionary class]]) {
            self.caption = captionDictionary[@"text"];
        } else {
            self.caption = @"";
        }
        
        NSMutableArray *commentsArray = [NSMutableArray array];
        
        
        
        for (NSDictionary *commentDictionary in mediaDictionary[@"comments"][@"data"]) {
            BLCComment *comment = [[BLCComment alloc] initWithDictionary:commentDictionary];
            [commentsArray addObject:comment];
        }
        
        self.comments = commentsArray;
        
        BOOL userHasLiked = [mediaDictionary[@"user_has_liked"] boolValue];
        
        self.likeState = userHasLiked ? BLCLikeStateLiked : BLCLikeStateNotLiked;
        
        NSDictionary *likedUserDictionary = mediaDictionary[@"likes"];
        
        // Caption might be null (if there's no caption)
        if ([likedUserDictionary isKindOfClass:[NSDictionary class]]) {
            self.likes = likedUserDictionary[@"count"];
        } else {
            self.likes = nil;
        }

        
//      NSMutableArray *likedUsersArray = [NSMutableArray array];
////       // Add the liked users into the array
//       for (NSDictionary *likedUsersDictionary in mediaDictionary[@"likes"][@"count"]) {
//            BLCLikedUsers *likedUsers = [[BLCLikedUsers alloc]initWithDictionary:likedUsersDictionary];
//            [likedUsersArray addObject:likedUsers];
//           
//            self.likes = likedUsersArray;
//      }
//    }
    }

    return self;
}

#pragma mark - NSCoding

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.idNumber = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(idNumber))];
        self.user = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(user))];
        self.mediaURL = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(mediaURL))];
        self.image = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(image))];
        self.likes = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(likes))];
        
        if (self.image) {
            self.downloadState = BLCMediaDownloadStateHasImage;
        } else if (self.mediaURL) {
            self.downloadState = BLCMediaDownloadStateNeedsImage;
        } else {
            self.downloadState = BLCMediaDownloadStateNonRecoverableError;
        }
        
        
        self.caption = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(caption))];
        self.comments = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(comments))];
        self.likeState = [aDecoder decodeIntegerForKey:NSStringFromSelector(@selector(likeState))];
        
    }
    
    return self;
}

// My assumption here is that I am saving the "likeState" to the disk with this section

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.idNumber forKey:NSStringFromSelector(@selector(idNumber))];
    [aCoder encodeObject:self.user forKey:NSStringFromSelector(@selector(user))];
    [aCoder encodeObject:self.mediaURL forKey:NSStringFromSelector(@selector(mediaURL))];
    [aCoder encodeObject:self.image forKey:NSStringFromSelector(@selector(image))];
    [aCoder encodeObject:self.caption forKey:NSStringFromSelector(@selector(caption))];
    [aCoder encodeObject:self.comments forKey:NSStringFromSelector(@selector(comments))];
    [aCoder encodeInteger:self.likeState forKey:NSStringFromSelector(@selector(likeState))];
    [aCoder encodeObject:self.likes forKey:NSStringFromSelector(@selector(likes))];
}


@end
