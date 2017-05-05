//
//  LogHelper.m
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/5.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import "LogHelper.h"

@implementation LogHelper

+ (NSMutableString *)FormatLog:(NSArray *)log {
    NSMutableString * fortmattedLog = [NSMutableString string];
    for(NSString * logLine in log) {
        [fortmattedLog appendString: logLine];
        [fortmattedLog appendString:@("\n")];
    }
    return fortmattedLog;
}

@end
