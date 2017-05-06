//
//  GraphicViewController.m
//  ToDoList
//
//  Created by 谭鹏飞 on 2017/5/6.
//  Copyright © 2017年 谭鹏飞. All rights reserved.
//

#import "GraphicViewController.h"
#import "GLHelper.h"

@interface GraphicViewController ()
@property (strong, nonatomic) IBOutlet GLKView *graphicGLKView;
@property NSMutableArray * log;

@end

@implementation GraphicViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Create an OpenGL ES context
    self.log = [NSMutableArray array];
    EAGLContext *ctx = [GLHelper CreateBestEAGLContext:self.log];
    if (ctx != Nil) {
        // Assign the context to the view loaded from storyboard
        self.graphicGLKView.context = ctx;
        
        // Configure renderbuffers created by the view
        self.graphicGLKView.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
        self.graphicGLKView.drawableDepthFormat = GLKViewDrawableDepthFormat24;
        self.graphicGLKView.drawableStencilFormat = GLKViewDrawableStencilFormat8;
        self.graphicGLKView.drawableMultisample = GLKViewDrawableMultisample4X;
        // Make this controller the delegate for the view loaded from the main storyboard
        self.graphicGLKView.delegate = self;
        
        // Set animation frame rate
        self.preferredFramesPerSecond = 25;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClearColor(0.0f, 0.5f, 0.5f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
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
