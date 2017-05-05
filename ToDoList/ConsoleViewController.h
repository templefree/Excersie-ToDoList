//
//  ConsoleViewController.h
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/5.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConsoleCmdStream.h"

@interface ConsoleViewController : UIViewController

@property id<ConsoleCmdStream> cmdStream;

@end
