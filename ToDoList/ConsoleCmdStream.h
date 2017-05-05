//
//  ConsoleCmdStream.h
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/5.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ConsoleCmdStream <NSObject>
- (void)RunCmdStream:(NSMutableArray *)log;
@end
