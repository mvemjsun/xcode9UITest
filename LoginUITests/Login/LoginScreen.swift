@testable import Login
import XCTest

class LoginScreen {

    let userNameTextBox = XCUIApplication().textFields["userNameTextField"]
    let passwordTextBox = XCUIApplication().secureTextFields["passwordTextField"]
    let signInButton = XCUIApplication().buttons["loginButton"]
    let headerLabel = XCUIApplication().staticTexts["Crypto Bank"]
    let textFieldSize = CGSize(width: 249, height: 30)
    let authLabel = XCUIApplication().staticTexts["Authenticating ..."]
    let activityIndicator = XCUIApplication().activityIndicators["loginActivityIndicator"]


    func userNameTextBoxExists(visibility visible: Bool = true) -> Bool {
        if visible {
            return userNameTextBox.existsAndVisible()
        } else {
            return userNameTextBox.exists
        }
    }

    func passwordTextBoxExists(visibility visible: Bool = true) -> Bool {
        if visible {
            return passwordTextBox.existsAndVisible()
        } else {
            return passwordTextBox.exists
        }
    }

    func signInButtonExists(visibility visible: Bool = true) -> Bool {
        if visible {
            return signInButton.existsAndVisible()
        } else {
            return signInButton.exists
        }
    }

    func loginWithRightCredentials(user userName: String, password passCode: String, submit: Bool = true) -> DashboardScreen {
        login(user: userName, password: passCode, submit: submit)
        return DashboardScreen()
    }

    func loginWithWrongCredentials(user userName: String, password passCode: String, submit: Bool = true) -> LoginScreen {
        login(user: userName, password: passCode, submit: submit)
        return LoginScreen()
    }

    private func login(user userName: String, password passCode: String, submit: Bool = true) {
        type(user: userName)
        type(password: passCode)
        guard submit else { return }
        signInButton.tap()
    }

    func type(user name: String) {
        userNameTextBox.tap()
        userNameTextBox.typeText(name)
    }

    func type(password passCode: String) {
        passwordTextBox.tap()
        passwordTextBox.typeText(passCode)
    }

    func placeHolderTextFor(element uiElement: XCUIElement) -> String? {
        if uiElement.elementType == .textField || uiElement.elementType == .secureTextField {
            return uiElement.placeholderValue
        } else {
            return ""
        }
    }
}
