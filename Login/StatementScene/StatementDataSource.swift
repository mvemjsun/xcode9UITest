import Foundation

class StatementDataSource {

    var statement: [AccountTransaction]?
    var account: Account

    init(account: Account) {
        self.account = account
        statement = []
        loadTransactions(forAccount: account)
    }

    // Load some test transactions
    private func loadTransactions(forAccount: Account) {
        let transactionsToGenerate = Constants.statementsRows
        var transactionsGenerated = 0
        var date: Date
        var transaction: AccountTransaction
        var summary: String
        var type: TransactionType
        while transactionsGenerated < transactionsToGenerate {
            date = randomDate(sequence: transactionsGenerated)
            summary = "Summary xxxxxxxx \(transactionsGenerated + 1)"
            type = creditOrDebit()
            switch type {
            case .credit:
                transaction = AccountTransaction(date: date, summary: summary, creditAmount: randomAmount(), account: forAccount)
            case .debit:
                transaction = AccountTransaction(date: date, summary: summary, debitAmount: randomAmount(), account: forAccount)
            }
            statement?.append(transaction)
            transactionsGenerated += 1
        }
        statement?.sort()
    }

    private func creditOrDebit() -> TransactionType {
        let random = abs(drand48() * 10)
        guard random > 5 else {
            return TransactionType.credit
        }
        return TransactionType.debit
    }

    // Random date from the last 31 days
    private func randomDate(sequence: Int) -> Date {
        let secondsInADay = 24 * 60 * 60 as Double
//        let random = Double(arc4random_uniform(31) + 1)
        let timeInterval = secondsInADay * Double(sequence)
        return Date() - timeInterval
    }

    private func randomAmount() -> Int16 {
        let number = Int16(arc4random_uniform(200) + 1)
        return number
    }
}

class AccountTransaction: Comparable {

    var date: Date
    var summary: String
    var creditAmount: Int16?
    var debitAmount: Int16?
    var balance: Int16

    init(date tranDate: Date, summary: String, creditAmount: Int16, account: Account) {
        self.date = tranDate
        self.summary = summary
        self.creditAmount = creditAmount
        self.debitAmount = 0
        account.credit(amount: creditAmount)
        balance = account.balance
    }

    init(date tranDate: Date, summary: String, debitAmount: Int16, account: Account) {
        self.date = tranDate
        self.summary = summary
        self.creditAmount = 0
        self.debitAmount = debitAmount
        account.debit(amount: debitAmount)
        balance = account.balance
    }

    static func <(lhs: AccountTransaction, rhs: AccountTransaction) -> Bool {
        return lhs.date > rhs.date
    }

    static func ==(lhs: AccountTransaction, rhs: AccountTransaction) -> Bool {
        return lhs.creditAmount == rhs.creditAmount || lhs.debitAmount == rhs.debitAmount
    }

}

class Account {
    var balance: Int16

    init(balance startingBalance: Int16) {
        self.balance = startingBalance
    }

    func credit(amount: Int16) {
        balance += amount
    }

    func debit(amount: Int16) {
        guard amount <= balance else { return }
        balance -= amount
    }
}

enum TransactionType {
    case credit
    case debit
}
