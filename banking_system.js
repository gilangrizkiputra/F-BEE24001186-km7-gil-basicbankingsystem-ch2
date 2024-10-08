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

let account = new BankingSystem("Gilang", "12345678", 5000);

function main() {
  try {
    console.log(
      "\nSelamat datang di ATM Bank berikut adalah pilihan yang bisa anda lakukan :"
    );
    console.log("1. Deposit");
    console.log("2. Withdraw");
    console.log("3. Check Balance");
    console.log("4. Exit");
    console.log("=================");

    rl.question("Masukkan pilihan anda: ", (choice) => {
      switch (choice) {
        case "1":
          rl.question("Masukkan nominal : Rp. ", (amount) => {
            account.deposit(parseInt(amount));
            setTimeout(() => {
              main();
            }, 1500);
          });
          break;
        case "2":
          rl.question("Masukkan nominal : Rp. ", (amount) => {
            account
              .withdraw(parseInt(amount))
              .then((resolve) => console.log(resolve))
              .catch((reject) => console.log(reject));
            setTimeout(() => {
              main();
            }, 1500);
          });
          break;
        case "3":
          account.accountInfo();
          setTimeout(() => {
            main();
          }, 1500);
          break;
        case "4":
          console.log("Sampai jumpa!");
          rl.close();
          break;
        default:
          console.log("Pilihan yang anda masukkan salah");
          main();
      }
    });
  } catch (error) {
    console.log(error);
  }
}

main();
