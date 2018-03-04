import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var authLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var interactor: LoginInteractor?
    enum AnimationStatus {
        case start
        case stop
    }

    @IBAction func loginPressed(_ sender: Any) {
        loginAnimation(status: .start)
        loginButton.isEnabled = false
        interactor?.login(with: userName.text, password: password.text)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = LoginPresenter()
        interactor = LoginInteractor()
        interactor?.presenter = presenter
        presenter.viewController = self
        setup()
        setAccessibilityIds()
    }

    private func setup() {
        userName.keyboardType = UIKeyboardType.asciiCapable
        password.isSecureTextEntry = true
        let image = UIImage(imageLiteralResourceName: "lock-locked")
        let view = LockUnlockButton(with: image)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: view)

        navigationItem.title = "Login"

        loginButton.backgroundColor = Constants.buttonGreen
        loginButton.layer.cornerRadius = loginButton.frame.height / 3
        loginButton.isEnabled = true

        animationComponentState(hidden: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        userName.becomeFirstResponder()
        loginButton.isEnabled = true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userName {
            userName.resignFirstResponder()
            password.becomeFirstResponder()
            return true
        }

        if textField == password {
            password.resignFirstResponder()
            loginPressed(self)  
            return true
        }
        return false
    }

    func loginDidSuceed() {
        userName.text = ""
        password.text = ""
        loginAnimation(status: .stop)
        performSegue(withIdentifier: "login", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

    func loginDidFail(message failedMessage: String) {
        userName.text = ""
        password.text = ""

        loginAnimation(status: .stop)
        let alert = UIAlertController(title: "LoginError", message: failedMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)

        loginButton.isEnabled = true
    }

    private func setAccessibilityIds() {
        userName.accessibilityIdentifier = Screen.LoginScreen.userNameTextField
        password.accessibilityIdentifier = Screen.LoginScreen.passWordTextField
        loginButton.accessibilityIdentifier = Screen.LoginScreen.loginButton
        navigationItem.rightBarButtonItem?.accessibilityIdentifier = Screen.LoginScreen.lockIcon
        authLabel.accessibilityIdentifier = Screen.LoginScreen.authLabel
        activityIndicator.accessibilityIdentifier = Screen.LoginScreen.activityIndicator
        headingLabel.accessibilityIdentifier = Screen.LoginScreen.headingLabel
    }

    func loginAnimation(status animationStatus: AnimationStatus) {
        switch animationStatus {
        case .start:
            animationComponentState(hidden: false)
            activityIndicator.startAnimating()
        case .stop:
            activityIndicator.stopAnimating()
            animationComponentState(hidden: true)

        }
    }

    private func animationComponentState(hidden state: Bool) {
        authLabel.isHidden = state
        activityIndicator.isHidden = state
    }
}
