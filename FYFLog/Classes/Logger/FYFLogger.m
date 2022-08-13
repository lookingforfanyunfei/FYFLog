//
//  FYFLogger.m
//  CocoaLumberjack
//
//  Created by 范云飞 on 2021/9/27.
//

#import "FYFLogger.h"
#import "FYFFormatterDefault.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

@implementation FYFLogger

+ (void)startLogger {
    [DDOSLogger sharedInstance].logFormatter = [FYFFormatterDefault new];
    [DDLog addLogger:[DDOSLogger sharedInstance]];
}

+ (void)stopLogger {
    [DDLog flushLog];
    [DDLog removeAllLoggers];
}

@end
