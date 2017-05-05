//
//  ConfiguringContextViewController.m
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/4.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import "ConfiguringContextViewController.h"
#import "LogHelper.h"
#import "GLHelper.h"

@interface ConfiguringContextViewController ()

@end

@implementation ConfiguringContextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableArray *log = [NSMutableArray array];
    
    EAGLContext *firstCtx = [GLHelper CreateBestEAGLContext:log];
    EAGLContext *secondCtx = [GLHelper CreateEAGLContextWithCommonShareGroup:log fromAnotherEAGLContext:firstCtx];
    [GLHelper SetCurrentGLContext:log withEAGLContext:firstCtx];
    [GLHelper SetCurrentGLContext:log withEAGLContext:secondCtx];
    [GLHelper SetCurrentGLContext:log withEAGLContext:Nil];
    self.consoleTextView.text = [LogHelper FormatLog:log];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
