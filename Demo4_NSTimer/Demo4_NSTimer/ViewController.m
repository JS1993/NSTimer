//
//  ViewController.m
//  Demo4_NSTimer
//
//  Created by  江苏 on 16/3/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)fly:(id)sender {
    [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(go:) userInfo:nil repeats:YES];
}
-(void)go:(NSTimer*)timer{
    static int count=0;
    count++;
    CGRect rect=self.imageView.frame;
    rect.origin.y=rect.origin.y-count;
    self.imageView.frame=rect;
    if (self.imageView.frame.origin.y<=50) {
        [timer invalidate];
    }
}
- (IBAction)goback:(id)sender {
    //每隔0.02秒变化一次（调用一次方法）
   [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(goBack:) userInfo:nil repeats:YES];
}
-(void)goBack:(NSTimer*)timer{
    static int count=0;
    count=self.imageView.frame.origin.y*0.1-1.5;
    CGRect rect=self.imageView.frame;
    rect.origin.y=rect.origin.y+count;
    self.imageView.frame=rect;
    if (self.imageView.frame.origin.y>=388) {
        [timer invalidate];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
