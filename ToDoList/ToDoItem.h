//
//  ToDoItem.h
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/3.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject
@property NSString* itemName;
@property BOOL complete;
@property (readonly) NSData* completionData;

@end
