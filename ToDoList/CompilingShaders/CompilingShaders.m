//
//  CompilingShaders.m
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/7.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import <OpenGLES/ES3/gl.h>
#import "CompilingShaders.h"
#import "GLHelper.h"
#import "ResourceHelper.h"


@implementation CompilingShaders

- (void)RunCmdStream:(NSMutableArray *)log {
    EAGLContext *ctx = [GLHelper CreateBestEAGLContext:log];
    NSString * shaderContent = [ResourceHelper LoadString:log fromResource:@"SimpleVertex" ofType:@"glsl"];
    if (shaderContent != Nil) {
        [log addObject:@"Shader Content:"];
        [log addObject:shaderContent];
        if ([GLHelper SetCurrentGLContext:log withEAGLContext:ctx]) {
            GLuint shaderHandler = glCreateShader(GL_VERTEX_SHADER);
            if ([GLHelper CheckGLError:log forGLCmd:@"(shaderHandler)glCreateShader(GL_VERTEX_SHADER)"]) {
                const char * const shaderContentCString = [shaderContent UTF8String];
                GLint shaderContentCStringLength = (GLint)[shaderContent length];
                glShaderSource(shaderHandler, 1, &shaderContentCString, &shaderContentCStringLength);
                if ([GLHelper CheckGLError:log forGLCmd:@"glShaderSource(shaderHandler, 1, &shaderContentCString, &shaderContentCStringLength)"]) {
                    glCompileShader(shaderHandler);
                    if ([GLHelper CheckGLError:log forGLCmd:@"glCompileShader(shaderHandler)"]) {
                        GLint compileSuccess;
                        glGetShaderiv(shaderHandler, GL_COMPILE_STATUS, &compileSuccess);
                        if ([GLHelper CheckGLError:log forGLCmd:@"glGetShaderiv(shaderHandler, GL_COMPILE_STATUS, &compileSuccess)"]) {
                            if (compileSuccess == GL_FALSE) {
                                GLchar messages[256];
                                glGetShaderInfoLog(shaderHandler, sizeof(messages), 0, messages);
                                if ([GLHelper CheckGLError:log forGLCmd:@"glGetShaderInfoLog(shaderHandler, sizeof(messages), 0, messages)"]){
                                    NSString *messageString = [NSString stringWithCString:messages encoding:kCFStringEncodingUTF8];
                                    [log addObject:messageString];
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    [GLHelper SetCurrentGLContext:log withEAGLContext:nil];
    
}
@end
