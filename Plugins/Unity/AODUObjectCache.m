//
//  AODUObjectCache.m
//  Unity-iPhone
//
//  Created by Dmitry B on 19.05.15.
//
//

#import <Foundation/Foundation.h>

#import "AODUObjectCache.h"

@implementation AODUObjectCache

+ (instancetype)sharedInstance {
    static AODUObjectCache *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        _references = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end

@implementation NSObject (GADUOwnershipAdditions)

- (NSString *)aodu_referenceKey {
    return [NSString stringWithFormat:@"%p", (void *)self];
}

@end
