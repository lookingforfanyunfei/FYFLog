//
//  FYFFormatterDefault.m
//  CocoaLumberjack
//
//  Created by 范云飞 on 2021/9/27.
//

#import "FYFFormatterDefault.h"

@interface FYFFormatterDefault () {
    NSString *_appName;
    DDAtomicCounter *_atomicLoggerCounter;
    NSDateFormatter *_threadUnsafeDateFormatter;
}

@end

@implementation FYFFormatterDefault

- (instancetype)init {
    _appName = [[NSProcessInfo processInfo] processName];
    return [self initWithDateFormatter:nil];
}

- (instancetype)initWithDateFormatter:(NSDateFormatter *)aDateFormatter {
    if ((self = [super init])) {
        if (aDateFormatter) {
            _threadUnsafeDateFormatter = aDateFormatter;
        } else {
            _threadUnsafeDateFormatter = [[NSDateFormatter alloc] init];
            [_threadUnsafeDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4]; // 10.4+ style
            [_threadUnsafeDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss:SSS"];
        }
    }
    return self;
}

- (NSString *)stringFromDate:(NSDate *)date {
    int32_t loggerCount = [_atomicLoggerCounter value];
    
    if (loggerCount <= 1) {
        // Single-threaded mode.
        
        if (!_threadUnsafeDateFormatter) {
            _threadUnsafeDateFormatter = [[NSDateFormatter alloc] init];
        }
        return [_threadUnsafeDateFormatter stringFromDate:date];
    } else {
        // Multi-threaded mode.
        // NSDateFormatter is NOT thread-safe.
        
        NSString *key = @"FYFFormatterDefault_NSDateFormatter";
        
        NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
        NSDateFormatter *dateFormatter = [threadDictionary objectForKey:key];
        
        if (!dateFormatter) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss:SSS"];
            [threadDictionary setObject:dateFormatter forKey:key];
        }
        return [dateFormatter stringFromDate:date];
    }
}

#pragma mark - DDLogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel; // 日志等级
    switch (logMessage->_flag) {
        case DDLogFlagError    : logLevel = @"Error";   break;
        case DDLogFlagWarning  : logLevel = @"Warning"; break;
        case DDLogFlagInfo     : logLevel = @"Info";    break;
        case DDLogFlagDebug    : logLevel = @"Debug";   break;
        default                : logLevel = @"Verbose"; break;
    }
    
    NSString *dateAndTime = [self stringFromDate:(logMessage.timestamp)]; // 日期和时间
    NSString *logFileName = logMessage -> _fileName; // 文件名
    NSString *logFunction = logMessage -> _function; // 方法名
    NSUInteger logLine = logMessage -> _line;        // 行号
    NSString *logMsg = logMessage->_message;         // 日志消息
    
    // 日志格式：应用名 日期和时间 文件名 方法名 : 行数 <日志等级> 日志消息
    return [NSString stringWithFormat:@"%@ %@ %@ %@ : %lu <%@> %@",_appName, dateAndTime, logFileName, logFunction, logLine, logLevel, logMsg];
}

- (void)didAddToLogger:(id <DDLogger>)logger {
    [_atomicLoggerCounter increment];
}

- (void)willRemoveFromLogger:(id <DDLogger>)logger {
    [_atomicLoggerCounter decrement];
}

@end
