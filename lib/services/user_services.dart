part of 'services.dart';

class UserSevices {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    await Future.delayed(Duration(microseconds: 500));

    return ApiReturnValue(value: mockUser);
    // return ApiReturnValue(message: 'Wrong email or passwors');

    // * kode diatas di gunakan ketika testing gagal login
  }
}

// * di buat static method siginIn di buat future karena asincronus email dan password itu akan di kirim ke backend
// * di kasi delay 500 mili detik untuk membuat delay
//  * kemudian kembalikan mock user untuk karena belum ada apinya 