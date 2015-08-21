//
// Created by Igor Glotov on 23/07/14.
// Copyright (c) 2014 Mailru Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTRGTracer : NSObject

@property (nonatomic) BOOL enableLogging;
+(MTRGTracer *) sharedTracer;

@end

extern void mtrg_tracer_i(NSString *, ...);
extern void mtrg_tracer_d(NSString *, ...);
extern void mtrg_tracer_e(NSString *, ...);

