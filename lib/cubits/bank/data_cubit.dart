import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/api/api_provider.dart';
import '../../data/model/data_model.dart';
import '../../data/network/my_response.dart';
import 'data_state.dart';

class BankCubit extends Cubit<BankState> {
  BankCubit() : super(LoadingBankState()) {
    getAllData();
  }

  Future<void> getAllData() async {
    emit(LoadingBankState());
    MyResponse myResponse = await ApiProvider.getAllData();
    if (myResponse.errorText.isEmpty) {
      emit(SuccessBankState(bankData: myResponse.data as List<DataModel>));
    } else {
      emit(ErrorBankState(errorText: myResponse.errorText));
    }
  }
}
