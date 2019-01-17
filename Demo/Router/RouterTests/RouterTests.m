//
//  RouterTests.m
//  RouterTests
//
//  Created by 刘科 on 2018/6/27.
//  Copyright © 2018 刘科. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ARouter.h"
@interface RouterTests : XCTestCase

@end

@implementation RouterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testRouter {
    NSString* url = @"snssdk1128://aweme/detail/6557626649536367879";
    url = @"sslocal://profile?uid=5806115967";
//    [ARouter register:<#(NSString *)#> handler:<#^(NSDictionary *)handler#>]
    [ARouter canOpenURL:url];
}

@end
