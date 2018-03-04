import UIKit

protocol LogoutButtonDelegateProtocol {
    func didPressLogout()
}

class LogoutButton: UIView {

    var delegate: LogoutButtonDelegateProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        addButton()
    }

    func addButton() {
        let button = UIButton(frame: self.frame)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        button.setTitleColor(.red, for: .highlighted)

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectedButton))
        tap.cancelsTouchesInView = false
        button.addGestureRecognizer(tap)

        addSubview(button)
    }

    @objc
    func selectedButton() {
        delegate?.didPressLogout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
