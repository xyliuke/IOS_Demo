//
//  ViewController.m
//  Demo
//
//  Created by 刘科 on 2018/6/27.
//  Copyright © 2018 刘科. All rights reserved.
//

#import <Router/ARouter.h>
#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) TestView* tv;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tick) userInfo:nil repeats:NO];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(tick:)
//                                                 name:UIApplicationDidBecomeActiveNotification object:nil];
//    [self tick:nil];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(150, 400, 100, 50)];
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"小" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.view.backgroundColor = [UIColor redColor];
    
//    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
}
- (void)click:(id)sener {
//    sel.definesPresentationContext = YES;
//    ViewController* vc = [[ViewController alloc]init];
//    vc.view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
//    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    [self.navigationController presentViewController:vc animated:NO completion:nil];
//    [self.navigationController pushViewController:vc animated:NO];

    [ARouter openURL:@"local://new_vc?a=b" parameter:@{@"3" : @"4"} callback:^(NSDictionary *dictionary) {
        NSLog(@"%@", dictionary);
    }];

}
- (void) tick:(id)sender {
    NSLog(@"tick");
    if (self.tv) {
        [self.tv removeFromSuperview];
    }
    self.tv = [[TestView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.tv.backgroundColor = [UIColor whiteColor];
    self.tv.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tv];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        if (self.tv) {
//            [self.tv removeFromSuperview];
//        }
//    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
