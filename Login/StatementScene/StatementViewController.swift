import UIKit

class StatementViewController: UITableViewController {

    var interactor: StatementViewInteractor?

    override func viewDidLoad() {
        interactor = StatementViewInteractor()
        registerNib()
        tableView.dataSource = interactor
        tableView.separatorColor = #colorLiteral(red: 0.1058823529, green: 0.7333333333, blue: 0.5019607843, alpha: 1)
        navigationItem.title = "Recent transactions"
    }

    private func registerNib() {
        let nib = UINib(nibName: "StatementCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "statementCell")
    }
}

extension StatementViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = Bundle.main.loadNibNamed("StatementHeader", owner: nil, options: nil)?.first as? UIView
        return view
    }
}
