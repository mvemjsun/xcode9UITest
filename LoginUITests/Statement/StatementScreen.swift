@testable import Login
import XCTest

class StatementScreen {

    func cellAt(row: Int) -> XCUIElement {
        let cell = XCUIApplication().cells.matching(identifier: identifierForStatementRowAt(row: row)).firstMatch
        return cell
    }

    private func identifierForStatementRowAt(row: Int) -> String {
        return "transactionRow_\(row)"
    }

    func transactionDateElementFor(cell: XCUIElement) -> XCUIElement {
        let element = elementFor(cell: cell, matching: "transactionDate")
        return element
    }

    func transactionCreditAmountElementFor(cell: XCUIElement) -> XCUIElement {
        let element = elementFor(cell: cell, matching: "transactionCreditAmount")
        return element
    }

    func transactionDebitAmountElementFor(cell: XCUIElement) -> XCUIElement {
        let element = elementFor(cell: cell, matching: "transactionDebitAmount")
        return element
    }

    func transactionSummaryElementFor(cell: XCUIElement) -> XCUIElement {
        let element = elementFor(cell: cell, matching: "transactionSummary")
        return element
    }

    func transactionAccountBalanceFor(cell: XCUIElement) -> XCUIElement {
        let element = elementFor(cell: cell, matching: "transactionAccountBalance")
        return element
    }

    func hasTitle(title: String) -> Bool {
        return XCUIApplication().navigationBars.matching(identifier: title).firstMatch.exists
    }

    private func elementFor(cell: XCUIElement, matching identifier: String) -> XCUIElement {
        let cell = cell.children(matching: .staticText).matching(identifier: identifier).firstMatch
        return cell
    }
}
