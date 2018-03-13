import UIKit

class StatementViewInteractor: NSObject, UITableViewDataSource {

    var dataSource: StatementDataSource
    var account: Account

    override init() {
        account = Account(balance: 2000)
        dataSource = StatementDataSource(account: account)
        super.init()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let statement = dataSource.statement else { return 0 }
        return statement.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statementCell", for: indexPath) as! StatementViewCell
        cell.accessibilityIdentifier = "transactionRow_\(indexPath.row + 1)"
        guard let statement = dataSource.statement else {
            fatalError("No data")
        }
        cell.configure(with: statement[indexPath.row])
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}
