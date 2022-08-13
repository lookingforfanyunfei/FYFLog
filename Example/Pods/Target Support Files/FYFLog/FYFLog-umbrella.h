#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "FYFFormatterDefault.h"
#import "FYFLog.h"
#import "FYFLogger.h"
#import "FYFLogLumberjack.h"

FOUNDATION_EXPORT double FYFLogVersionNumber;
FOUNDATION_EXPORT const unsigned char FYFLogVersionString[];

