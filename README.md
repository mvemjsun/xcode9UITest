# Xcode9 UI Tests Demo

## Summary
Sample application that introduces how to integrate XCUI Tests in your iOS apps. The app has a login screen. When the user tries to login with an incorrect password an alert is displayed. To add some features to the login screen, the app simulates a 1s delay when login button is touched and displays an authenticating message along with an activity indicator.

When a correct username and password is entered the user is shown his account dashboard. The account dashboard has two buttons one with Title `Accounts` and another with title `Statement`. Tapping the accounts button presents a test alert. Tapping the statement button presents a statement screen with some random transactions.

## Prerequisites

* XCode 9

## Main test code
* LoginScreenTests.swift - Has UI Tests for login screen
* LoginScreen.swift - Has the Login screen definitions and interactions
* XCTestExtension.swift - Has an `XCUIElement` and `XCTestCase` extensions.
* StatementScreenTests.swift - Has tests for the statement screen.

## Screens
![Login](https://github.com/mvemjsun/xcode9UITest/blob/master/Images/Login.png)
![Dashboard](https://github.com/mvemjsun/xcode9UITest/blob/master/Images/Dashboard.png)
![Accounts](https://github.com/mvemjsun/xcode9UITest/blob/master/Images/Accounts.png)
![Statement](https://github.com/mvemjsun/xcode9UITest/blob/master/Images/Statement.png)
