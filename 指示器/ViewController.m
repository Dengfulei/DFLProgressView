//
//  ViewController.m
//  指示器
//
//  Created by 杭州移领 on 16/12/21.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import "ViewController.h"
#import "DFLProgressView.h"
@interface ViewController ()
@property (nonatomic, strong) DFLProgressView *circleProgress;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height )];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    self.circleProgress = [DFLProgressView showViewAddedTo:self.navigationController.view imageName:@"货到付款图标"];
    self.circleProgress.progressColor = [UIColor greenColor];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(progressTimer:) userInfo:nil repeats:YES];
}
- (void)progressTimer:(NSTimer *)timer
{
    self.circleProgress.percent += 0.05;
    
    
    if(self.circleProgress.percent > 1)
    {
        [self.timer invalidate];
        [self.circleProgress hide:YES after:2];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
