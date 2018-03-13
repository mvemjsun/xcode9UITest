class Screen {

    struct LoginScreen {
        static let passWordTextField = "passwordTextField"
        static let userNameTextField = "userNameTextField"
        static let loginButton = "loginButton"
        static let authLabel = "authLabel"
        static let activityIndicator = "loginActivityIndicator"
        static let lockIcon = "lock-locked"
        static let headingLabel = "headingLabel"
    }

    struct DashBoard {
        static let welcomeText = "welcomeText"
        static let accountsButton = "accountsButton"
        static let statementButton = "statementButton"
        static let logoutButton = "logoutButton"
        static let unlockedButton = "lock-unlocked"
    }

    struct Statement {
        static let transactionDate = "transactionDate"
        static let creditAamount = "transactionCreditAmount"
        static let debitAamount = "transactionDebitAmount"
        static let accountBalance = "transactionAccountBalance"
        static let transactionSummary = "transactionSummary"
    }
}
