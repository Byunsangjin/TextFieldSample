//
//  TextFieldSampleUITests.m
//  TextFieldSampleUITests
//
//  Created by Byunsangjin on 08/07/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TextFieldSampleUITests : XCTestCase

@end

@implementation TextFieldSampleUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testInputTextAndTouchedButton {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    XCUIElement *tfTextField = app.textFields[@"textField"];
    XCUIElement *button = app.buttons[@"button"];
    XCUIElement *label = app.staticTexts[@"label"];
    
    [tfTextField tap];
    [tfTextField typeText:@"12.75"];
    [button tap];
    
    XCTAssertTrue([label.label isEqualToString:@"12.75"]);
    
    [tfTextField tap];
    [app/*@START_MENU_TOKEN@*/.menuItems[@"Select All"]/*[[".menus.menuItems[@\"Select All\"]",".menuItems[@\"Select All\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [app/*@START_MENU_TOKEN@*/.keys[@"Delete"]/*[[".keyboards.keys[@\"Delete\"]",".keys[@\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [tfTextField typeText:@".75"];
    [button tap];
    
    XCTAssertTrue([label.label isEqualToString:@"0.75"]);
    
    [tfTextField tap];
    [app/*@START_MENU_TOKEN@*/.menuItems[@"Select All"]/*[[".menus.menuItems[@\"Select All\"]",".menuItems[@\"Select All\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [app/*@START_MENU_TOKEN@*/.keys[@"Delete"]/*[[".keyboards.keys[@\"Delete\"]",".keys[@\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [tfTextField typeText:@"129847.751232"];
    [button tap];
    
    XCTAssertTrue([label.label isEqualToString:@"129.75"]);
    
    [tfTextField tap];
    [app/*@START_MENU_TOKEN@*/.menuItems[@"Select All"]/*[[".menus.menuItems[@\"Select All\"]",".menuItems[@\"Select All\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [app/*@START_MENU_TOKEN@*/.keys[@"Delete"]/*[[".keyboards.keys[@\"Delete\"]",".keys[@\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [tfTextField typeText:@"1234."];
    [button tap];
    
    XCTAssertTrue([label.label isEqualToString:@"123"]);
}

@end
