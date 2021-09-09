import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:deliveryfood/models/models.dart';
import 'package:deliveryfood/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserSevices.signIn(email, password);

// * arti kode di atas adalj dibuat future of foid (tidak mengembalikan apa apa) yang berisi fungsi signIn yang isinya string email dan string password
// * kemudian async dari api return value of User 'models' karena mengambil datanya dari api yang di simoan di result
// * kemudian tungu hinga userservices yang berisi fungsi sign email dan password

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));

      // * kemudian if jika result yang nilainya tidak sama dengan null atau kosong maka kembalikan userloaded yang berisi nilai result
      // * selaiinn itu jika result sama dengan null alias gagal memuat yang dikarenakan salah email atau password atau ga ada internet
      // * makak tampilkan userloadingfailed yang mengembalikan hasil pesan dari user state

    }
  }

  //! kode di bawah di buat ketika sudah selesai membuat fungsi signUp dan uploadProfilePicture di user_servieces.dart yang telah berisi api

  //* di buat method signup yang berisi parameter User models yang berisi user, String password dan file picturefile
  // * jangan lupa import dart.io agar bisa menggunakan File
  //* api retun value of user di simpan dalam result mengandung await UserSevices dengan fungsi signUp yang berisi parameter user, password dan picturefile ( pictureFile di dapat dari  {File pictureFile})
  Future<void> signUp(User user, String password, {File pictureFile}) async {
    ApiReturnValue<User> result =
        await UserSevices.signUp(user, password, pictureFile: pictureFile);

    //* if jika result value tidak sama dengan null maka emit user loaded yang berisi result value
    //* selain itu emit user loading failed yang berisi pesan dari result message
    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  //* di buat method uploadProfilePicture yang berisi File pictureFile
  //* api return value of String di simpan dalam result mengandung await UserSevices dengan fungsi uploadProfilePicture yang berisi parameter pictureFile
  Future<void> uploadProfilePicture(File pictureFile) async {
    ApiReturnValue<String> result =
        await UserSevices.uploadProfilePicture(pictureFile);

    //* if jika result value tidak sama dengan null maka ubah picturePath yang berada di link url + resulit nilai tersebut
    if (result.value != null) {
      emit(UserLoaded((state as UserLoaded).user.copyWith(
          picturePath: 'http://foodmarket-backend.buildwithangga.id/storage/' +
              result.value)));
    }
  }
}
