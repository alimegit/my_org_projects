
import '../../data/model/data_model.dart';
abstract class BankState {}

class ErrorBankState extends BankState {
  String errorText;

  ErrorBankState({required this.errorText});
}
class LoadingBankState extends BankState {}

class SuccessBankState extends BankState {
  List<DataModel> bankData;

  SuccessBankState({required this.bankData});
}