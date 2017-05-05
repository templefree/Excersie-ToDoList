//
//  ConsoleViewController.m
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/5.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import "ConsoleViewController.h"
#import "LogHelper.h"
@interface ConsoleViewController ()
@property (weak, nonatomic) IBOutlet UITextView *consoleTextView;

@end

@implementation ConsoleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableArray *log = [NSMutableArray array];
    if (self.cmdStream != Nil) {
        [self.cmdStream RunCmdStream:log];
    }
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
