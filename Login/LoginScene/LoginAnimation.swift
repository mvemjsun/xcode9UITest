import UIKit

class LoginAnimation {

    var activityIndicator: UIActivityIndicatorView?

    func startAnimating() {
        activityIndicator?.startAnimating()
    }

    func stopAnimating() {
        activityIndicator?.stopAnimating()
    }

    func makeView() {
        let rect = CGRect(x: 0, y: 0, width: 20, height: 20)
        let view = UIView(frame: rect)
        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.alpha = 0.7
        activityIndicator = UIActivityIndicatorView(frame: rect)
        guard let activityIndicator = activityIndicator else { return }
        view.addSubview(activityIndicator)
    }
}
