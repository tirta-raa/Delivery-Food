part of 'services.dart';

//* di buat class transaction services
//* di buat static future of api return value of list of transaction dengan nama fungsi getTransactions
//* dengan parameter http.Client dengan nama client async if jika client sama dengan null maaka kembalika http,client()

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions(
      {http.Client client}) async {
    client ??= http.Client();

    //* di buat url string base url+transaction
    //* var response await client di get karena jenisnya get dari apinya panggil urlnya
    //* headers isinya content type dengan value application/json
    //* autohorization isinya Bearer dengan isi yang di ambil dari user model dan di ambil tokenya

    //? karena di backend di limit tampilanya hanya 6 maka kita tambahkan menjadi 1000 tampilan
    String url = baseUrl + 'transaction/?limit=1000';
    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${User.token}'
    });

    //*  if jika response status code tidak sama dengan 200 maka kembalikan pesan

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Failed to get transactions');
    }

    //* di buat var yang mengandung fungsi jsonDecode [di dapat dari transation models line 27] dengan parameter response.body
    //*  List of transactions sama dengan data di ambil dari tabel data dan colom data secara berutan [irerabel]
    //* di map e mengembalikan transaction models dan fromJson dengan kunci e kemudian to list

    var data = jsonDecode(response.body);
    List<Transaction> transactions = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    //* kembalikan api return value dengan value transactions

    return ApiReturnValue(value: transactions);
  }

  //* hampir sama artinya dengan kode di atas hanya beda methodnya saja
  //* kalau di atas get kalau di bawah karena kita akan mesubmit maka methodnya post

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseUrl + 'checkout';

    var response = await client.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${User.token}'
        },
        //? di ubah dari bentuk map menjadi bentuk jesonya karena kita ngepost ke api
        body: jsonEncode(<String, dynamic>{
          'food_id': transaction.food.id,
          'user_id': transaction.user.id,
          'quantity': transaction.quantity,
          'total': transaction.total,
          'status': 'PENDING'
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Failed to submit transaction');
    }

    var data = jsonDecode(response.body);
    Transaction value = Transaction.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }
}

// ! kode di bawah di gunakan untuk data dummy bukan untuk api

// part of 'services.dart';

// class TransactionServices {
//   static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
//     await Future.delayed(Duration(seconds: 3));

//     * menampilkan transaksi

//     return ApiReturnValue(value: mockTranscation);
//   }

//   static Future<ApiReturnValue<Transaction>> submitTransaction(
//       Transaction transaction) async {
//     await Future.delayed(Duration(seconds: 2));

//     *untuk mesubmit transaksi jika sudah berhasil memlakukan pembelian datanya akan di kirim ke backend

//     return ApiReturnValue(
//         value:
//             transaction.copyWith(id: 123, status: TransactionStatus.pending));
//     * jika berhasil akan mengembalikan trransaction status dari nomor backend 'kode di atas untuk testing'

//     return ApiReturnValue(message: 'Transaksi gagal');

//     * kode di atas untuk testing pesan error get.snacbar
//   }
// }
