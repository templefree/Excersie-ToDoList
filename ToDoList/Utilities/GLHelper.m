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
    [log addObject:@("#CreatBestEAGLContext:")];
    EAGLContext * ctx = [EAGLContext alloc];
    if (ctx != Nil) {
        [log addObject:@("(ctx)[EAGLContext alloc]...OK")];
    }
    EAGLContext * bestCtx = [ctx initWithAPI:kEAGLRenderingAPIOpenGLES3];
    if (bestCtx != Nil) {
        [log addObject:@("(bestCtx)[ctx initWithAPI:kEAGLRenderingAPIOpenGLES3]...OK")];
    }
    else {
        [log addObject:@("(Nil)[ctx initWithAPI:kEAGLRenderingAPIOpenGLES3]...FAIL")];
        bestCtx = [ctx initWithAPI:kEAGLRenderingAPIOpenGLES2];
        if (bestCtx != Nil) {
            [log addObject:@("(bestCtx)[ctx initWithAPI:kEAGLRenderingAPIOpenGLES2]...OK")];
        }
        else {
            [log addObject:@("(Nil)[ctx initWithAPI:kEAGLRenderingAPIOpenGLES2]...FAIL")];
        }
    }
    return bestCtx;
}

+ (EAGLContext *)CreateEAGLContextWithCommonShareGroup:(NSMutableArray *)log fromAnotherEAGLContext:(EAGLContext *) anotherCtx {
    [log addObject:@("#CreateEAGLContextWithCommonShareGroup: fromAnotherEAGLContext:")];
    EAGLContext * ctx = [EAGLContext alloc];
    if (ctx != Nil) {
        [log addObject:@("(ctx)[EAGLContext alloc]...OK")];
        EAGLRenderingAPI api = [anotherCtx API];
        [log addObject:@("(api)[anotherCtx API]...OK")];
        EAGLSharegroup * sharegroup = [anotherCtx sharegroup];
        if (sharegroup != Nil) {
            [log addObject:@("(sharegroup)[anotherCtx sharegroup]...OK")];
            EAGLContext * ctxWithCommonShareGroup = [ctx initWithAPI:api sharegroup:sharegroup];
            if (ctxWithCommonShareGroup != Nil) {
                [log addObject:@("(ctxWithCommonShareGroup)[ctx initWithAPI:api sharegroup:sharegroup]...OK")];
                return ctxWithCommonShareGroup;
            }
            else {
                [log addObject:@("(ctxWithCommonShareGroup)[ctx initWithAPI:api sharegroup:sharegroup]...FAIL")];
            }
        }
        else {
            [log addObject:@("(sharegroup)[anotherCtx sharegroup]...FAIL")];
        }
    }
    else {
        [log addObject:@("(ctx)[EAGLContext alloc]...FAIL")];
    }
    return Nil;
}

+ (void)SetCurrentGLContext:(NSMutableArray *)log withEAGLContext:(EAGLContext *)ctx {
    [log addObject:@("#SetCurrentGLContext:")];
    if (ctx != Nil) {
        if ([EAGLContext setCurrentContext:ctx]) {
            [log addObject:@("(YES)[EAGLContext setCurrentContext:ctx]...OK")];
        }
        else {
            [log addObject:@("(NO)[EAGLContext setCurrentContext:ctx]...FAIL")];
        }
    }
    else {
        if ([EAGLContext setCurrentContext:Nil]) {
            [log addObject:@("(YES)[EAGLContext setCurrentContext:Nil]...OK")];
        }
        else {
            [log addObject:@("(NO)[EAGLContext setCurrentContext:Nil]...FAIL")];
        }
    }
}

+ (NSArray *)GetGLExtensions:(NSMutableArray *)log {
    [log addObject:@("#GetGLExtensions:")];
    EAGLContext *ctx = [EAGLContext currentContext];
    NSMutableArray *extensions = [NSMutableArray array];
    if (ctx != Nil) {
        [log addObject:@("(ctx)[EAGLContext currentContext]...OK")];
        EAGLRenderingAPI api = [ctx API];
        if (api == kEAGLRenderingAPIOpenGLES3) {
            int max;
            glGetIntegerv(GL_NUM_EXTENSIONS, &max);
            [log addObject:@("glGetIntegerv(GL_NUM_EXTENSIONS, &max)...OK")];
            int i;
            for (i = 0; i < max; ++i) {
                const char * extensionCString = (char *)glGetStringi(GL_EXTENSIONS, i);
                if (extensionCString == NULL) {
                    break;
                }
                [extensions addObject:@(extensionCString)];
            }
            if (i == max) {
                [log addObject:@("glGetStringi(GL_EXTENSIONS, i)...OK")];
            }
            else {
                [log addObject:@("glGetStringi(GL_EXTENSIONS, i)...FAIL")];
                [extensions removeAllObjects];
            }
            return extensions;
        }
        else if (api == kEAGLRenderingAPIOpenGLES2) {
            const char * extensionsCString = (char *)glGetString(GL_EXTENSIONS);
            if (extensionsCString != NULL) {
                [log addObject:@("(char *)glGetString(GL_EXTENSIONS)...OK")];
                NSString * extensionsString = @(extensionsCString);
                return [extensionsString componentsSeparatedByString:@(" ")];
            }
            else {
                [log addObject:@("(NULL)glGetString(GL_EXTENSIONS)...FAIL")];
            }
            
        }
    }
    else {
        [log addObject:@("(Nil)[EAGLContext currentContext]...FAIL")];
    }
    return extensions;
}


@end
