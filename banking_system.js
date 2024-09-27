const BankAccount = require("./bank_account.js");
const readline = require("readline");
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

class BankingSystem extends BankAccount {
  constructor(accountName, accountNumber, balance) {
    super(accountName, accountNumber, balance);
  }

  accountInfo() {
    console.log(`\nNama Akun : ${this.accountName}`);
    console.log(`No. Akun : ${this.accountNumber}`);
    console.log(`Saldo : ${this.balance}`);
  }

  deposit(amount) {
    console.log("Sedang menambah saldo, Harap tunggu...");
    setTimeout(() => {
      const newBalance = super.deposit(amount);
      console.log(`Saldo anda sekarang Rp. ${newBalance}`);
      console.log("Berhasil menambah saldo");
    }, 1500);
  }

  withdraw(amount) {
    console.log("Proses penarikan saldo sedang berlangsung...");

    return new Promise((resolve, reject) => {
      setTimeout(() => {
        if (amount < 500) {
          reject("Gagal melakukan penarikan, minimal penarikan adalah Rp. 500");
        } else {
          const newBalance = super.withdraw(amount);
          console.log(`Saldo anda sekarang Rp. ${newBalance}`);
          resolve("Berhasil menarik saldo");
        }
      }, 1500);
    });
  }
}