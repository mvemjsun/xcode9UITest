# Xcode9 UI Tests

## Summary
Sample application that introduces how to integrate XCUI Tests in oyour iOS apps. The app has a login screen. When the user tries to login with an incorrect password an alert is displayed. When a correct username and password is entered the user is shown his account dashboard. To add some features to the login screen, the app simulates a 2s delay when login button is touched and displays an authenticating message along with an activity indicator.

## Prerequisites

* XCode 9

## Main test code
* LoginScreenTests.swift - Has UI Tests
* LoginScreen.swift - Has the Login screen definitions and interactions
* XCTestExtension.swift - Has an `XCUIElement` and `XCTestCase` extensions.
