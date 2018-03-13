import Foundation

protocol LoginServiceDelegate {
    func didLoginWithSuccess()
    func didLoginWithFailure()
}

protocol LoginServiceProtocol {
    var delegate: LoginServiceDelegate? { get set }
    func login(with user: String, password auth: String)
}

class LoginService: LoginServiceProtocol {

    var delegate: LoginServiceDelegate?

    func login(with user: String, password auth: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if user == Constants.userName && auth == Constants.password {
                self.delegate?.didLoginWithSuccess()
            } else {
                self.delegate?.didLoginWithFailure()
            }
        }
    }
}
