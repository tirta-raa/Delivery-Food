part of 'services.dart';

class UserSevices {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    await Future.delayed(Duration(microseconds: 500));

    return ApiReturnValue(value: mockUser);
  }
}
