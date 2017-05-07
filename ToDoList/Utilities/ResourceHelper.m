//
//  ResourceHelper.m
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/7.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import "ResourceHelper.h"

@implementation ResourceHelper

+ (NSString *)LoadString:(NSMutableArray *)log fromResource: (NSString *)name ofType:(NSString *)type {
    NSString *string = Nil;
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle != Nil) {
        [log addObject:@"(bundle)[NSBundle mainBundle]...OK"];
        NSString *resourcePath = [bundle pathForResource:name ofType:type];
        if (resourcePath != Nil) {
            [log addObject:@"(resourcePath)[bundle pathForResource:name ofType:type]...OK"];
            NSError *error;
            string = [NSString stringWithContentsOfFile:resourcePath encoding:kCFStringEncodingUTF8 error:&error];
            if (string != Nil) {
                [log addObject:@"(string)[NSString stringWithContentsOfFile:resourcePath encoding:kCFStringEncodingUTF8 error:&error]...OK"];
            }
            else {
                [log addObject:@"(Nil)[NSString stringWithContentsOfFile:resourcePath encoding:kCFStringEncodingUTF8 error:&error]...FAIL"];
            }
        }
        else {
            [log addObject:@"(Nil)[bundle pathForResource:name ofType:type]...FAIL"];
        }
    }
    else {
        [log addObject:@"(Nil)[NSBundle mainBundle]...FAIL"];
    }
    return string;
}
@end
