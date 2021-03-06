//
//  DTAlertViewTest.m
//  DTFoundation
//
//  Created by Rene Pirringer on 22.07.14.
//  Copyright (c) 2014 Cocoanetics. All rights reserved.
//

@import DTFoundation;

#if TARGET_OS_IPHONE && !TARGET_OS_TV && !TARGET_OS_WATCH && __IPHONE_OS_VERSION_MIN_REQUIRED < 80000

@import UIKit;
@import XCTest;

@interface DTAlertView(Private) <UIAlertViewDelegate>
@end


@implementation DTAlertView(Private)
@end


@interface DTAlertViewTest : XCTestCase
@end



@implementation DTAlertViewTest

- (void)testInitMethods {
	__block BOOL blockExecuted = NO;
	DTAlertView *alertView = [[DTAlertView alloc] init];
	[alertView addButtonWithTitle:@"Ok" block:^{
		blockExecuted = YES;
	}];

	[alertView alertView:alertView clickedButtonAtIndex:alertView.numberOfButtons - 1];
	
	XCTAssertTrue(blockExecuted, @"The ok button block should be executed");

    blockExecuted = NO;
    alertView = [[DTAlertView alloc] initWithTitle:@"Foo" message:@"bar"];
		[alertView addCancelButtonWithTitle:@"Cancel" block:nil];
    [alertView addButtonWithTitle:@"Ok" block:^{
        blockExecuted = YES;
    }];
    
    [alertView alertView:alertView clickedButtonAtIndex:alertView.numberOfButtons - 1];
    
    XCTAssertTrue(blockExecuted, @"The ok button block should be executed");

    blockExecuted = NO;
    alertView = [[DTAlertView alloc] initWithTitle:@"Foo" message:@"bar" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"a", @"b", nil];
    [alertView addButtonWithTitle:@"Ok" block:^{
        blockExecuted = YES;
    }];
    
    [alertView alertView:alertView clickedButtonAtIndex:alertView.numberOfButtons - 1];
    
    XCTAssertTrue(blockExecuted, @"The ok button block should be executed");
	
}

- (void)testInitMethod_delegate {
	
	__block BOOL blockExecuted = NO;
	DTAlertView *alertView = [[DTAlertView alloc] initWithTitle:@"Foo" message:@"bar"];
	[alertView addCancelButtonWithTitle:@"Cancel" block:nil];
	[alertView addButtonWithTitle:@"Ok" block:^{
		blockExecuted = YES;
	}];
	
	[alertView.delegate alertView:alertView	clickedButtonAtIndex:alertView.numberOfButtons - 1];
	XCTAssertTrue(blockExecuted, @"The ok button block should be executed");

}

@end

#endif
