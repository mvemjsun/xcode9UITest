class LoginHelper {

    func loginOK(with screen: LoginScreen, user: String, password: String) -> DashboardScreen {
        return screen.loginWithRightCredentials(user: user, password: password)
    }

    func loginBad(with screen: LoginScreen, user: String, password: String) -> LoginScreen {
        return screen.loginWithWrongCredentials(user: user, password: password)
    }
}
