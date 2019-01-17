//
// Created by 刘科 on 2019-01-17.
// Copyright (c) 2019 刘科. All rights reserved.
//

#import <Router/ARouter.h>
#import "NewViewController.h"



@implementation NewViewController {

}

+ (void)load {
    [super load];
    [ARouter register:@"local://new_vc" handler:^(NSDictionary *dictionary, void (^pFunction)(NSDictionary *)) {
        NewViewController *vc = [[NewViewController alloc] init];
        NSLog(@"%@",dictionary);
        if (pFunction) {
            pFunction(@{@"1": @"2"});
        }
    }];
}

@end
