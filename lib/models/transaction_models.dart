part of 'models.dart';

enum TransactionStatus { deliered, on_delivery, pending, cancelled }

// * fungsi enum adalah mengganti atau memberi nama pada status yang tadinya berupa angka menjadi kata

class Transaction extends Equatable {
  final int id;
  final Food food;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus status;
  final User user;

  Transaction(
      {this.id,
      this.food,
      this.quantity,
      this.total,
      this.dateTime,
      this.status,
      this.user});

  Transaction copyWith(
      {int id,
      Food food,
      int quantity,
      int total,
      DateTime dateTime,
      TransactionStatus status,
      User user}) {
    return Transaction(
        id: id ?? this.id,
        food: food ?? this.food,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status,
        user: user ?? this.user);
  }

  // * dibuat method dengan nama transaction  kemudian di buat nama copyWith dari class transaction with equatable
  //  * karena equatable jadi ga bisa di ubah lagi makanya di buatlah method ini
  //  * jadi kalau mau ngedit bisa di masukan ke copywith baru di masukan kesini
  //  * kemudian kembalikna transactionya yang baru dengan parameternya sesuai dengan transaction
  //  * misal sesuai dengan parameter id transation kalau id nya sama dengan null maka ga perlu di isi
  //  * tapi kalau di isi seusai yang ada

  @override
  List<Object> get props => [id, food, quantity, total, dateTime, status, user];
}

List<Transaction> mockTranscation = [
  Transaction(
    id: 1,
    food: mockFoods[1],
    quantity: 10,
    total: (mockFoods[1].price * 10 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.on_delivery,
    user: mockUser,
  ),
  Transaction(
    id: 2,
    food: mockFoods[2],
    quantity: 7,
    total: (mockFoods[2].price * 7 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.deliered,
    user: mockUser,
  ),
  Transaction(
    id: 3,
    food: mockFoods[3],
    quantity: 5,
    total: (mockFoods[3].price * 5 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.cancelled,
    user: mockUser,
  ),
  // * di buat list transaksi bohongan
  //  * kemudian di buat transactionya dengan id 1 foodnya di ambil dari mockFoods kenapa bisa di ambil dari mockfood karena di atas sudah di masukan food yang di dimpor dari food models [1] angka satu itu dari item ke satu
  //  * quantiti atau jumlahnya 7
  //  * kemudian harga mockfood 1 di kali total qunatity di kali 1.1 itu artinya pajak 10% di tambah 50.000
  //  * date time di tambahkan itu emang udah ada dari flutternya
  //  * statusnya di ganti menjadi on delivery karena sudah di buat enumnya di paling atas
];
