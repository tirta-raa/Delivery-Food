part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;
  static String token;

  const User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath});

  //* membuat fungsi fromJson dengan parameter Map string dinamis dengan nama data
  //* key ['id'] dan lain lainya disesuaikan dengan nama yang berada di API

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        address: data['address'],
        houseNumber: data['houseNumber'],
        phoneNumber: data['phoneNumber'],
        city: data['city'],
        picturePath: data['profile_photo_url'],
      );

  //* metode copywith ini berfungsi untuk mengkopi sebuah onjek user menjadi sebuah objek user yang baru
  //* dengan properti yang bisa di ubah sesuai dengan parameter yang di masukan

  User copyWith({
    int id,
    String name,
    String email,
    String address,
    String houseNumber,
    String phoneNumber,
    String city,
    String picturePath,
  }) =>
      User(
        //* dimana user yang baru akan menggunakan field yang lama kecuali ada parameter yang dimasukan
        //* contoh jika id di isi dengan parameter baru  maka akan di ganti dengan parameter baru
        // * kalau null atau kosong ga di ganti atau ga di isi maka tampilkan parameter lama yaitu this.id

        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        address: address ?? this.address,
        houseNumber: houseNumber ?? this.houseNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        city: city ?? this.city,
        picturePath: picturePath ?? this.picturePath,
      );

  @override
  List<Object> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = const User(
  id: 1,
  name: 'John Doe',
  email: 'doe@gmail.com',
  address: '123 Fake Street',
  houseNumber: '123',
  phoneNumber: '555-1212',
  city: 'New York',
  picturePath:
      'https://images.unsplash.com/photo-1499482125586-91609c0b5fd4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
);
