//
//  TestView.m
//  Demo
//
//  Created by 刘科 on 2018/7/10.
//  Copyright © 2018 刘科. All rights reserved.
//

#import "TestView.h"

@interface TTView : UIView
@end

@implementation TTView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView* image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        image.backgroundColor = [UIColor greenColor];
        [self addSubview:image];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 0, 50, 50)];
        btn.backgroundColor = [UIColor grayColor];
        [self addSubview:btn];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, 50, 50)];
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"label";
        [self addSubview:label];
    }
    return self;
}
- (void)click:(id)sener {
    NSLog(@"click");
}
@end

@interface TestView()
@property (nonatomic, strong) TTView* tv;
@end

@implementation TestView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.tv = [[TTView alloc]init];
        self.tv.frame = CGRectMake(10, 100, 200, 200);
        self.tv.backgroundColor = [UIColor redColor];
        [self addSubview:self.tv];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(150, 400, 100, 50)];
        btn.backgroundColor = [UIColor grayColor];
        [btn setTitle:@"小" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        btn = [[UIButton alloc]initWithFrame:CGRectMake(150, 470, 100, 50)];
        btn.backgroundColor = [UIColor grayColor];
        [btn setTitle:@"大" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(click1:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}
static CGFloat rate = 1.f;
- (void) layoutSubviews {
    [super layoutSubviews];
}
- (void)click:(id)sender {
    rate -= 0.1;
    self.tv.transform = CGAffineTransformMakeScale(rate, rate);
}

- (void)click1:(id)sender {
    rate += 0.1;
    self.tv.transform = CGAffineTransformMakeScale(rate, rate);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
