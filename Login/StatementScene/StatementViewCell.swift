import UIKit

class StatementViewCell: UITableViewCell {

    @IBOutlet weak var transactionDate: UILabel!
    @IBOutlet weak var debitAmount: UILabel!
    @IBOutlet weak var creditAmount: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with transaction: AccountTransaction) {
        transactionDate.text = formatDate(date: transaction.date)
        debitAmount.text = formatAmount(amount: transaction.debitAmount)
        debitAmount.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        creditAmount.text = formatAmount(amount: transaction.creditAmount)
        creditAmount.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        balance.text = formatAmount(amount: transaction.balance)
        summary.text = transaction.summary.uppercased()
        setAccessibilityIds()
    }

    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM-dd"
        return formatter.string(from: date)
    }

    func formatAmount(amount: Int16?) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "£"
        formatter.currencyGroupingSeparator = ","
        formatter.maximumFractionDigits = 1
        guard let amount = amount else { return "" }
        let formattedAmount = amount != 0 ? formatter.string(from: amount as NSNumber) : ""
        return formattedAmount ?? ""
    }

    func setAccessibilityIds() {
        transactionDate.accessibilityIdentifier = Screen.Statement.transactionDate
        debitAmount.accessibilityIdentifier = Screen.Statement.debitAamount
        creditAmount.accessibilityIdentifier = Screen.Statement.creditAamount
        balance.accessibilityIdentifier = Screen.Statement.accountBalance
        summary.accessibilityIdentifier = Screen.Statement.transactionSummary
    }
}
