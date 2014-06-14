//
//  CustomFontTesterTests.m
//  CustomFontTesterTests
//
//  Created by Venkat Rao on 11/29/13.
//  Copyright (c) 2013 Rao Studios. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIFont+RSCustom.h"
@interface CustomFontTesterTests : XCTestCase

@end

@implementation CustomFontTesterTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFontCreation
{
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    XCTAssertNotNil(font, @"font creation failed");
}



@end
