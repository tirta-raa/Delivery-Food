import 'package:bloc/bloc.dart';
import 'package:deliveryfood/models/models.dart';
import 'package:deliveryfood/services/services.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransactions() async {
    ApiReturnValue<List<Transaction>> result =
        await TransactionServices.getTransactions();

    if (result.value != null) {
      emit(TransactionLoaded(result.value));
    } else {
      emit(TransactionLoadingFailed(result.message));
    }
  }

//! jika sudah menggunakan api maka submit transaction gunakan ini untuk mengetahui pake api atau tidak lihat transaction_services.dart

  //* di ubah jadi future string karena akan mengembalikan payment url dari midtrans
  Future<String> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> result =
        await TransactionServices.submitTransaction(transaction);

    if (result.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transaction + [result.value]));
      //?jadi di kembalikanya result value dan payment url dari mitrans
      return result.value.paymentUrl;
    } else {
      return null;
    }
  }
}

//! jika submit transaction masih dumy gunakan ini
//  * arti kode di atas adalah di buat future yang mengembalikan nilai true atau false
//     * di buat future bolean dengan nama fungsi yang akan mesubmit nilai dari transaksi
//     *  kemudian di buat apireturn value of transaction kemudian di simpan di result
//     * di tunggu dari transaction services kemudian submit transaction transaction
//   Future<bool> submitTransaction(Transaction transaction) async {
//     ApiReturnValue<Transaction> result =
//         await TransactionServices.submitTransaction(transaction);

   
//       *  kemudian if jika result tidak sama dengan null maka tampilkan
//       *  emit kemudian di gabungkan state saat ini dengan result yang di kembalikan
//       * kemudian return true
//       *  selain itu false
//     if (result.value != null) {
//       emit(TransactionLoaded(
//           (state as TransactionLoaded).transaction + [result.value]));
//       return true;



//     } else {
//       return false;
//     }
//   }
// }
