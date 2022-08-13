//
//  FYFFormatterDefault.h
//  CocoaLumberjack
//
//  Created by 范云飞 on 2021/9/27.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

NS_ASSUME_NONNULL_BEGIN

/// 默认格式化类
@interface FYFFormatterDefault : NSObject <DDLogFormatter>

/// Default initializer
- (instancetype)init;

/// Designated initializer, requires a date formatter
/// @param dateFormatter dataFormatter
- (instancetype)initWithDateFormatter:(NSDateFormatter *)dateFormatter NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
