//
//  FYFLogger.h
//  CocoaLumberjack
//
//  Created by 范云飞 on 2021/9/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYFLogger : NSObject

/// start logger
+ (void)startLogger;

/// stop logger
+ (void)stopLogger;

@end

NS_ASSUME_NONNULL_END
