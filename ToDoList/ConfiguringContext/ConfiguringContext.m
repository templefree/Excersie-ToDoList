//
//  ConfiguringContext.m
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/5.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import "ConfiguringContext.h"
#import "LogHelper.h"
#import "GLHelper.h"

@implementation ConfiguringContext

- (void)RunCmdStream:(NSMutableArray *)log {
    EAGLContext *firstCtx = [GLHelper CreateBestEAGLContext:log];
    EAGLContext *secondCtx = [GLHelper CreateEAGLContextWithCommonShareGroup:log fromAnotherEAGLContext:firstCtx];
    [GLHelper SetCurrentGLContext:log withEAGLContext:firstCtx];
    [GLHelper SetCurrentGLContext:log withEAGLContext:secondCtx];
    [GLHelper SetCurrentGLContext:log withEAGLContext:Nil];
}
@end
