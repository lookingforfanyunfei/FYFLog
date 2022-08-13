//
//  FYFLogLumberjack.h
//  Pods
//
//  Created by 范云飞 on 2021/9/27.
//

#ifndef FYFLogLumberjack_h
#define FYFLogLumberjack_h

#import <CocoaLumberjack/CocoaLumberjack.h>

#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelInfo;
#endif

#define FYFLogError(frmt, ...)   LOG_MAYBE(NO,  ddLogLevel, DDLogFlagError,  0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define FYFLogWarn(frmt, ...)    LOG_MAYBE(YES, ddLogLevel, DDLogFlagWarning,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define FYFLogInfo(frmt, ...)    LOG_MAYBE(YES, ddLogLevel, DDLogFlagInfo,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define FYFLogDebug(frmt, ...)   LOG_MAYBE(YES, ddLogLevel, DDLogFlagDebug,  0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)

#endif /* FYFLogLumberjack_h */
