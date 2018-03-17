import UIKit

class StatementViewPresenter {
    var viewController: UIViewController?

    func configure(cell: StatementViewCell, with transaction: AccountTransaction) {
        cell.configure(with: transaction)
    }
}
