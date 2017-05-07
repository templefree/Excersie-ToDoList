//
//  GLHelper.h
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/5.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGLES/EAGL.h>

@interface GLHelper : NSObject
+ (EAGLContext *)CreateBestEAGLContext: (NSMutableArray *)log;

+ (EAGLContext *)CreateEAGLContextWithCommonShareGroup:(NSMutableArray *)log fromAnotherEAGLContext:(EAGLContext *) anotherCtx;

+ (BOOL)SetCurrentGLContext:(NSMutableArray *)log withEAGLContext:(EAGLContext *)ctx;

+ (NSArray *)GetGLExtensions:(NSMutableArray *)log;

+ (BOOL)CheckGLError:(NSMutableArray *)log forGLCmd:(NSString *) glCmd;

@end