@testable import Login
import XCTest

class DashboardScreen {

    let logoutButton = XCUIApplication().buttons.matching(identifier:"logoutButton").firstMatch
    let barTitle = XCUIApplication().navigationBars.firstMatch.title
    let lockUnlocked = XCUIApplication().navigationBars.firstMatch.images.matching(identifier: "lock-unlocked").firstMatch
    let accountsButton = XCUIApplication().buttons.matching(identifier:"accountsButton").firstMatch
    let statementButton = XCUIApplication().buttons.matching(identifier:"statementButton").firstMatch

    func tapStatementButton() -> StatementScreen {
        statementButton.tap()
        let statementScreen = StatementScreen()
        return statementScreen
    }

    func tapAccountButton() {
        accountsButton.tap()
    }
}
