
import Foundation

class LoginPresenter {
    weak var viewController: LoginController?

    func loginDidSuceed() {
        viewController?.loginDidSuceed()
    }

    func loginDidFail() {
        viewController?.loginDidFail(message: "We could not login you. Please try again.")
    }
}
