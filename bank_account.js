
let saldo = 0;

class BankAccount{

  tambahSaldo(tambah){
    tambah = window.prompt("tambah saldo ?");
    saldo += parseInt(tambah);
    alert("saldo anda Rp. " + saldo);
  }


  kurangSaldo(kurang) {
    kurang = window.prompt("kurang saldo ?");
    saldo -= parseInt(kurang);
    alert("saldo anda Rp. " + saldo);
  }
}

let bankAccount = new BankAccount();

bankAccount.tambahSaldo()
bankAccount.kurangSaldo()



