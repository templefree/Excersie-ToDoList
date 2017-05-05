//
//  VerifyingCapabilities.m
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/5.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import "VerifyingCapabilities.h"
#import "GLHelper.h"

@implementation VerifyingCapabilities

- (void)RunCmdStream:(NSMutableArray *)log {
    EAGLContext * ctx = [GLHelper CreateBestEAGLContext:log];
    [GLHelper SetCurrentGLContext:log withEAGLContext:ctx];
    NSArray *extenions = [GLHelper GetGLExtensions:log];
    [log addObjectsFromArray:extenions];
    [GLHelper SetCurrentGLContext:log withEAGLContext:Nil];
    
}

@end
