part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    await Future.delayed(Duration(seconds: 3));

    // * menampilkan transaksi

    return ApiReturnValue(value: mockTranscation);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(Duration(seconds: 2));

    // *untuk mesubmit transaksi jika sudah berhasil memlakukan pembelian datanya akan di kirim ke backend

    // return ApiReturnValue(
    //     value:
    //         transaction.copyWith(id: 123, status: TransactionStatus.pending));
    // * jika berhasil akan mengembalikan trransaction status dari nomor backend 'kode di atas untuk testing'

    return ApiReturnValue(message: 'Transaksi gagal');

    // * kode di atas untuk testing pesan error get.snacbar
  }
}


// * kode di atas di gunakan untuk data dummy bukan untuk api