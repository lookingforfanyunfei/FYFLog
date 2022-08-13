//
//  FYFViewController.m
//  FYFLog
//
//  Created by 786452470@qq.com on 08/13/2022.
//  Copyright (c) 2022 786452470@qq.com. All rights reserved.
//

#import "FYFViewController.h"
#import <FYFLog/FYFLog.h>

@interface FYFViewController ()

@end

@implementation FYFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self logInfoMessage];
    [self logDebugMessage];
    [self logWarnMessage];
    [self logErrorMessage];
}

- (void)logInfoMessage {
    FYFLogInfo(@"测试info message");
    DDLogInfo(@"DDLogInfo");
}

- (void)logDebugMessage {
    FYFLogDebug(@"测试debug message");
    DDLogDebug(@"DDLogDebug");
}

- (void)logWarnMessage {
    FYFLogWarn(@"测试warn message");
    DDLogWarn(@"DDLogWarn");
}

- (void)logErrorMessage {
    FYFLogError(@"测试error message");
    DDLogError(@"DDLogError");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
