//
//  GLHelper.m
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/5.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import "GLHelper.h"
#import <OpenGLES/ES3/gl.h>

@implementation GLHelper

+ (EAGLContext * )CreateBestEAGLContext: (NSMutableArray *)log {
    [log addObject:@"#CreatBestEAGLContext:"];
    EAGLContext * ctx = [EAGLContext alloc];
    if (ctx != Nil) {
        [log addObject:@"(ctx)[EAGLContext alloc]...OK"];
    }
    EAGLContext * bestCtx = [ctx initWithAPI:kEAGLRenderingAPIOpenGLES3];
    if (bestCtx != Nil) {
        [log addObject:@"(bestCtx)[ctx initWithAPI:kEAGLRenderingAPIOpenGLES3]...OK"];
    }
    else {
        [log addObject:@"(Nil)[ctx initWithAPI:kEAGLRenderingAPIOpenGLES3]...FAIL"];
        bestCtx = [ctx initWithAPI:kEAGLRenderingAPIOpenGLES2];
        if (bestCtx != Nil) {
            [log addObject:@"(bestCtx)[ctx initWithAPI:kEAGLRenderingAPIOpenGLES2]...OK"];
        }
        else {
            [log addObject:@"(Nil)[ctx initWithAPI:kEAGLRenderingAPIOpenGLES2]...FAIL"];
        }
    }
    return bestCtx;
}

+ (EAGLContext *)CreateEAGLContextWithCommonShareGroup:(NSMutableArray *)log fromAnotherEAGLContext:(EAGLContext *) anotherCtx {
    [log addObject:@"#CreateEAGLContextWithCommonShareGroup: fromAnotherEAGLContext:"];
    EAGLContext * ctx = [EAGLContext alloc];
    if (ctx != Nil) {
        [log addObject:@"(ctx)[EAGLContext alloc]...OK"];
        EAGLRenderingAPI api = [anotherCtx API];
        [log addObject:@"(api)[anotherCtx API]...OK"];
        EAGLSharegroup * sharegroup = [anotherCtx sharegroup];
        if (sharegroup != Nil) {
            [log addObject:@"(sharegroup)[anotherCtx sharegroup]...OK"];
            EAGLContext * ctxWithCommonShareGroup = [ctx initWithAPI:api sharegroup:sharegroup];
            if (ctxWithCommonShareGroup != Nil) {
                [log addObject:@"(ctxWithCommonShareGroup)[ctx initWithAPI:api sharegroup:sharegroup]...OK"];
                return ctxWithCommonShareGroup;
            }
            else {
                [log addObject:@"(ctxWithCommonShareGroup)[ctx initWithAPI:api sharegroup:sharegroup]...FAIL"];
            }
        }
        else {
            [log addObject:@"(sharegroup)[anotherCtx sharegroup]...FAIL"];
        }
    }
    else {
        [log addObject:@"(ctx)[EAGLContext alloc]...FAIL"];
    }
    return Nil;
}

+ (BOOL)SetCurrentGLContext:(NSMutableArray *)log withEAGLContext:(EAGLContext *)ctx {
    [log addObject:@"#SetCurrentGLContext:"];
    EAGLContext *currentCtx = [EAGLContext currentContext];
    if (currentCtx != Nil) {
        [log addObject:@"(currentCtx)[EAGLContext currentContext]...OK"];
        glFlush();
        [log addObject:@"glFlush()...OK"];
    }
    else {
        [log addObject:@"(Nil)[EAGLContext currentContext]...OK"];
    }
    if (ctx != Nil) {
        if ([EAGLContext setCurrentContext:ctx]) {
            [log addObject:@"(YES)[EAGLContext setCurrentContext:ctx]...OK"];
            return YES;
        }
        else {
            [log addObject:@"(NO)[EAGLContext setCurrentContext:ctx]...FAIL"];
            return NO;
        }
    }
    else {
        if ([EAGLContext setCurrentContext:Nil]) {
            [log addObject:@"(YES)[EAGLContext setCurrentContext:Nil]...OK"];
            return YES;
        }
        else {
            [log addObject:@"(NO)[EAGLContext setCurrentContext:Nil]...FAIL"];
            return NO;
        }
    }
}

+ (NSArray *)GetGLExtensions:(NSMutableArray *)log {
    [log addObject:@"#GetGLExtensions:"];
    EAGLContext *ctx = [EAGLContext currentContext];
    NSMutableArray *extensions = [NSMutableArray array];
    if (ctx != Nil) {
        [log addObject:@"(ctx)[EAGLContext currentContext]...OK"];
        EAGLRenderingAPI api = [ctx API];
        if (api == kEAGLRenderingAPIOpenGLES3) {
            int max;
            glGetIntegerv(GL_NUM_EXTENSIONS, &max);
            [log addObject:@"glGetIntegerv(GL_NUM_EXTENSIONS, &max)...OK"];
            int i;
            for (i = 0; i < max; ++i) {
                const char * extensionCString = (char *)glGetStringi(GL_EXTENSIONS, i);
                if (extensionCString == NULL) {
                    break;
                }
                NSString * extensionString = [NSString stringWithCString:extensionCString encoding:NSUTF8StringEncoding];
                [extensions addObject:extensionString];
            }
            if (i == max) {
                [log addObject:@"glGetStringi(GL_EXTENSIONS, i)...OK"];
            }
            else {
                [log addObject:@"glGetStringi(GL_EXTENSIONS, i)...FAIL"];
                [extensions removeAllObjects];
            }
            return extensions;
        }
        else if (api == kEAGLRenderingAPIOpenGLES2) {
            const char * extensionsCString = (char *)glGetString(GL_EXTENSIONS);
            if (extensionsCString != NULL) {
                [log addObject:@"(char *)glGetString(GL_EXTENSIONS)...OK"];
                NSString * extensionsString = [NSString stringWithCString: extensionsCString encoding:NSUTF8StringEncoding];
                return [extensionsString componentsSeparatedByString:@" "];
            }
            else {
                [log addObject:@"(NULL)glGetString(GL_EXTENSIONS)...FAIL"];
            }
            
        }
    }
    else {
        [log addObject:@"(Nil)[EAGLContext currentContext]...FAIL"];
    }
    return extensions;
}
+ (BOOL)CheckGLError:(NSMutableArray *)log forGLCmd:(NSString *) glCmd {
    GLenum error;
    NSMutableString *logItem = [NSMutableString string];
    [logItem appendString:glCmd];
    error = glGetError();
    if (error == GL_NO_ERROR){
        [logItem appendString:@"...OK"];
        [log addObject:logItem];
        return YES;
    }
    else {
        [logItem appendFormat:@"...ERROR:%x", error];
        [log addObject:logItem];
        return NO;
    }
}

@end
