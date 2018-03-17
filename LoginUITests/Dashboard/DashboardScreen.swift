@testable import Login
import XCTest

class DashboardScreen {

    let logoutButton = XCUIApplication().buttons["Logout"].firstMatch
    let lockUnlocked = XCUIApplication().navigationBars.firstMatch.images.matching(identifier: "lock-unlocked").firstMatch
    let accountsButton = XCUIApplication().buttons.matching(identifier:"accountsButton").firstMatch
    let statementButton = XCUIApplication().buttons.matching(identifier:"statementButton").firstMatch
    let welcomeText = XCUIApplication().staticTexts.matching(identifier: "welcomeText").firstMatch

    func tapStatementButton() -> StatementScreen {
        statementButton.tap()
        let statementScreen = StatementScreen()
        return statementScreen
    }

    func tapAccountButton() {
        accountsButton.tap()
    }

    func logout() -> LoginScreen {
        logoutButton.tap()
        return LoginScreen()
    }

    func navigationBarTitle() -> String {
        let barTitle = XCUIApplication().navigationBars.firstMatch.identifier
        return barTitle
    }

    func welcomeTextExists(with text: String) -> Bool{
        return XCUIApplication().staticTexts[text].firstMatch.exists
    }
}
