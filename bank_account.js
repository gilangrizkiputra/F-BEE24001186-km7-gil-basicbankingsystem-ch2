class BankAccount {
  constructor(accountName, accountNumber, balance) {
    this.accountName = accountName;
    this.accountNumber = accountNumber;
    this.balance = balance;
  }

  deposit(amount) {
    return (this.balance += amount);
  }

  withdraw(amount) {
    if (amount > this.balance) {
      throw new Error("Gagal melakukan penarikan, saldo tidak mencukupi");
    }

    return (this.balance -= amount);
  }
}

