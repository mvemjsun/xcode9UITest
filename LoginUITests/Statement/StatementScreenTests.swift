@testable import Login
import XCTest

class StatementScreenTests: XCTestCase {

    var statementScreen: StatementScreen!
    var loginScreen: LoginScreen!
    var dashBoardScreen: DashboardScreen!

    override func setUp() {
        super.setUp()
        statementScreen = StatementScreen()
        continueAfterFailure = false
        XCUIApplication().launch()
        XCUIDevice.shared.orientation = .portrait
        loginScreen = LoginScreen()
        dashBoardScreen = loginScreen.loginWithRightCredentials(user: Constants.Login.validUser, password: Constants.Login.validPassword)
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_StatementScreen_Shows_CorrectTitle() {
        launchStatementScreen()
        XCTAssertTrue(statementScreen.hasTitle(title: "Recent transactions"))
    }

    func test_StatementScreen_HasLastRow55WithCorrectSummary() {
        let cell = statementScreen.cellAt(row: 55)
        launchStatementScreen()
        XCUIApplication().tables.firstMatch.swipeUp()
        let condition: () -> Bool = {
            return cell.isHittable
        }
        XCUIApplication().tables.firstMatch.swipe(direction: .up, timeout: 10, until: condition)
        let summaryText = statementScreen.transactionSummaryElementFor(cell: cell)
        XCTAssertEqual("SUMMARY XXXXXXXX 55",summaryText.label)
    }

    func test_StatementScreen_Has_StatementRow_WithRightSize() {
        let cell = statementScreen.cellAt(row: 1)
        launchStatementScreen()
        XCTAssertEqual(55, cell.frame.height)
    }

    private func launchStatementScreen() {
        waitForElement(dashBoardScreen.statementButton)
        statementScreen = dashBoardScreen.tapStatementButton()
    }
}
