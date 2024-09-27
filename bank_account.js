class BankAccount {
  withdraw(amount) {
    if (amount > this.balance) {
      throw new Error("Gagal melakukan penarikan, saldo tidak mencukupi");
    }

    return (this.balance -= amount);
  }
}



