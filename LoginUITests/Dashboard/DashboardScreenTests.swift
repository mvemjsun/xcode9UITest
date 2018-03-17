@testable import Login
import XCTest

class DashboardScreenTests: XCTestCase {

    var dashboardScreen: DashboardScreen!
    var loginScreen: LoginScreen!

    override func setUp() {
        super.setUp()
        dashboardScreen = DashboardScreen()
        continueAfterFailure = false
        XCUIApplication().launch()
        XCUIDevice.shared.orientation = .portrait
        loginScreen = LoginScreen()
        dashboardScreen = loginScreen.loginWithRightCredentials(user: Constants.Login.validUser, password: Constants.Login.validPassword)
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_DashboardScreen_Has_AccountAndStatement_Buttons() {
        waitForElement(dashboardScreen.accountsButton)
        XCTAssertTrue(dashboardScreen.accountsButton.exists)
    }

    func test_Dashboardscreen_Has_CorrectTitle() {
        waitForElement(dashboardScreen.accountsButton)
        XCTAssertEqual("Account Dashboard", dashboardScreen.navigationBarTitle())
    }

    func test_DashboardScreen_Has_WelcomeText() {
        waitForElement(dashboardScreen.accountsButton)
        XCTAssertTrue(dashboardScreen.welcomeText.exists)
    }

    func test_DashboardScreen_Has_Correct_WelcomeText() {
        waitForElement(dashboardScreen.accountsButton)
        XCTAssertTrue(dashboardScreen.welcomeTextExists(with: "Welcome back"))
    }

    func test_DashboardScreen_Logout() {
        waitForElement(dashboardScreen.accountsButton)
        let logoutScreen = dashboardScreen.logout()
        waitForElement(logoutScreen.signInButton)
    }
}
