import UIKit

class WelcomeController: UIViewController {

    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var accountsButton: UIButton!
    
    var interactor: WelcomeInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = WelcomePresenter()
        interactor?.presenter = presenter
        presenter.viewController = self
        setUp()
        setUpButtons()
    }

    func setUp() {
        let button = LogoutButton()
        button.delegate = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)

        let image = UIImage(imageLiteralResourceName: "lock-unlocked")
        let view = LockUnlockButton(with: image)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: view)
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
