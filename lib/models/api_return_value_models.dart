part of 'models.dart';

class ApiReturnValue<T> {
  final T value;
  final String message;

  ApiReturnValue({this.value, this.message});
}

// *arti kode di atas adalah sebagai tipe kembalikan servise yang akan di buat 
// * ketika kita memanggil api ada kemungkinan berhasil dan tidak
// * jika berhasil adalah kembalian valuenya
// * kalau gagal ya kita tidak mengembalikan apa apa tapi kita kasih pesan salahnya