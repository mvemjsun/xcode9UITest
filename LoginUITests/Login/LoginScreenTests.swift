@testable import Login
import XCTest

class LoginScreenTests: XCTestCase {

    var loginScreen: LoginScreen!

    override func setUp() {
        super.setUp()
        loginScreen = LoginScreen()
        continueAfterFailure = false
        XCUIApplication().launch()
        XCUIDevice.shared.orientation = .portrait
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_LoginScreen_WhenLaunched_Has_UserName_Password_SignIn() {
        waitForElement(loginScreen.headerLabel)
        XCTAssertTrue(loginScreen.userNameTextBoxExists())
        XCTAssertTrue(loginScreen.passwordTextBoxExists())
        XCTAssertTrue(loginScreen.signInButtonExists())
    }

    func test_LoginScreen_UserName_Has_PlaceHolderText() {
        XCTAssertEqual("Username", loginScreen.placeHolderTextFor(element: loginScreen.userNameTextBox))
    }

    func test_LoginScreen_Password_Has_PlaceHolderText() {
        XCTAssertEqual("Password", loginScreen.placeHolderTextFor(element: loginScreen.passwordTextBox))
    }

    func test_LoginScreen_SignInButton_Has_CorrectTitleText() {
        XCTAssertEqual("Sign In", loginScreen.signInButton.label)
    }

    func test_LoginScreen_UserNameField_Has_CorrectSize() {
        let actualSize = loginScreen.userNameTextBox.size()
        let expectedSize = loginScreen.textFieldSize
        XCTAssertTrue(expectedSize.equalTo(actualSize))
    }

    func test_LoginScreen_UserNameField_Has_CorrectSizeWhenRotated() {
        XCUIDevice.shared.orientation = .landscapeLeft
        let actualSize = loginScreen.userNameTextBox.size()
        let expectedSize = loginScreen.textFieldSize
        print(loginScreen.userNameTextBox.debugDescription)
        XCTAssertTrue(expectedSize.equalTo(actualSize))
    }

    func test_LoginScreen_When_Wrong_UserDetails_ShowsAlert() {
        _ = loginScreen.loginWithWrongCredentials(user: "wrongUser", password: "wrongPass")
        waitForElement(loginScreen.authLabel, visibility: false)
        let element = XCUIApplication().alerts.firstMatch
        XCTAssertEqual(element.label, "LoginError")
    }

//    func test_LoginScreen_WithWrongDetails_Shows_AuthMessage_And_ActivityIndicator() {
//        _ = loginScreen.loginWithWrongCredentials(user: "wrongUser", password: "wrongPass")
//        waitForElement(loginScreen.authLabel, visibility: true)
//        let element = loginScreen.activityIndicator
//        XCTAssertTrue(element.isVisible())
//    }
}
