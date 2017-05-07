//
//  ResourceHelper.h
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/7.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResourceHelper : NSObject

+ (NSString *)LoadString:(NSMutableArray *)log fromResource: (NSString *)name ofType:(NSString *)type;

@end
