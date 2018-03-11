import UIKit

class WelcomeController: UIViewController {

    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var accountsButton: UIButton!
    var tapGestureRecogniser: UITapGestureRecognizer?

    var interactor: WelcomeInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = WelcomePresenter()
        interactor?.presenter = presenter
        presenter.viewController = self
        setUp()
        setUpButtons()
        setGestureRecognisers()
    }

    func setUp() {
        let button = LogoutButton()
        button.delegate = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)

        let image = UIImage(imageLiteralResourceName: "lock-unlocked")
        let view = LockUnlockButton(with: image)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: view)
    }

    @IBAction func accountButtonTapped(_ sender: Any) {
        accountsButton.resignFirstResponder()
    }
    func setUpButtons() {
        payButton.backgroundColor = Constants.creditCardColor
        payButton.layer.cornerRadius = payButton.frame.height/3

        accountsButton.backgroundColor = Constants.accountsColor
        accountsButton.layer.cornerRadius = accountsButton.frame.height/3
    }
}

extension WelcomeController: LogoutButtonDelegateProtocol {
    func didPressLogout() {
        navigationController?.popViewController(animated: true)
    }
}

extension WelcomeController {

    func setAccessibilityIds() {
        payButton.accessibilityIdentifier = "payButton"
        accountsButton.accessibilityIdentifier = "accountsButton"
        navigationItem.rightBarButtonItem?.accessibilityIdentifier = "lock-unlocked"
        navigationItem.leftBarButtonItem?.accessibilityIdentifier = "logoutButton"
    }
}

// Gesture recognisers
extension WelcomeController: UIGestureRecognizerDelegate {
    func setGestureRecognisers() {
        tapGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(accountButtonTap))
        guard let tapGestureRecogniser = tapGestureRecogniser else { return }
        accountsButton.addGestureRecognizer(tapGestureRecogniser)
    }

    @objc func accountButtonTap() {
        let alert = UIAlertController(title: "Accounts", message: "Account button tapped", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alertAction2 = UIAlertAction(title: "Cancel", style: .default, handler: nil)

        alert.addAction(alertAction)
        alert.addAction(alertAction2)
        present(alert, animated: false, completion: nil)
    }
}
