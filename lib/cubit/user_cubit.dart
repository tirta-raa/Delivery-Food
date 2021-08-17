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

    if (result != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));

      // * kemudian if jika result tidak sama dengan null atau kosong maka kembalikan userloaded yang berisi nilai result
      // * selaiinn itu jika result sama dengan null alias gagal memuat yang dikarenakan salah email atau password atau ga ada internet
      // * makak tampilkan userloadingfailed yang mengembalikan hasil pesan dari user state

    }
  }
}
