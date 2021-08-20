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

  Future<bool> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> result =
        await TransactionServices.submitTransaction(transaction);

    // * arti kode di atas adalah di buat future yang mengembalikan nilai true atau false
    // * di buat future bolean dengan nama fungsi yang akan mesubmit nilai dari transaksi
    // *  kemudian di buat apireturn value of transaction kemudian di simpan di result
    // * di tunggu dari transaction services kemudian submit transaction transaction

    if (result.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transaction + [result.value]));
      return true;

      // *  kemudian if jika result tidak sama dengan null maka tampilkan
      // *  emit kemudian di gabungkan state saat ini dengan result yang di kembalikan
      // * kemudian return true
      // *  selain itu false

    } else {
      return false;
    }
  }
}
