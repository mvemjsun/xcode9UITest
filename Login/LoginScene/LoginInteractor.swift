import Foundation

class LoginInteractor {
    var presenter: LoginPresenter?
    var loginService: LoginServiceProtocol?

    init(login service: LoginServiceProtocol = LoginService()) {
        self.loginService = service
    }

    func login(with user: String?, password enteredPassword: String?) {
        loginService?.delegate = self
        guard let user = user, let enteredPassword = enteredPassword, user.count > 0, enteredPassword.count > 0 else {
            self.didLoginWithFailure()
            return
        }
        loginService?.login(with: user, password: enteredPassword)
    }
}

extension LoginInteractor: LoginServiceDelegate {
    func didLoginWithSuccess() {
        presenter?.loginDidSuceed()
    }

    func didLoginWithFailure() {
        presenter?.loginDidFail()
    }
}
