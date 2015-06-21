//
//  AODUObjectCache.h
//  Unity-iPhone
//
//  Created by Dmitry B on 19.05.15.
//
//

#import <Foundation/Foundation.h>

/// A cache to hold onto objects while Unity is still referencing them.
@interface AODUObjectCache : NSObject

+ (instancetype)sharedInstance;

/// References to objects Appodeal ads objects created from Unity.
@property(nonatomic, strong) NSMutableDictionary *references;

@end

@interface NSObject (AODUOwnershipAdditions)

/// Returns a key used to lookup a Appodeal Ads object. This method is intended to only be used
/// by Appodeal Ads objects.
- (NSString *)aodu_referenceKey;

@end
