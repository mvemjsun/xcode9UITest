@testable import Login
import XCTest

class DashboardScreen {

    let logoutButton = XCUIApplication().buttons["logoutButton"]
    let barTitle = XCUIApplication().navigationBars.firstMatch.title
    let lockUnlocked = XCUIApplication().navigationBars.firstMatch.images["lock-unlocked"]
    let accountsButton = XCUIApplication().buttons["accountsButton"]
    let payButton = XCUIApplication().buttons["payButton"]

}

