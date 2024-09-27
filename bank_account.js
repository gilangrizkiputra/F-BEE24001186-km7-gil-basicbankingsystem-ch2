class BankAccount {
  constructor(accountName, accountNumber, balance) {
    this.accountName = accountName;
    this.accountNumber = accountNumber;
    this.balance = balance;
  }

  deposit(amount) {
    return (this.balance += amount);
  }
}




