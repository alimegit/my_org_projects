import 'package:default_project/data/model/sender_model.dart';

class DataModel {
  int transactionCode;
  DateTime date;
  int incomeId;
  double amount;
  int cardId;
  SenderModel sender;

  DataModel({
    required this.sender,
    required this.transactionCode,
    required this.date,
    required this.incomeId,
    required this.amount,
    required this.cardId,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      transactionCode: json['transaction_code'] as int? ?? 0,
      date: DateTime.parse(json['date'] as String? ?? ""),
      incomeId: json['income_id'] as int? ?? 0,
      amount: (json['amount'] as num? ?? 0.0).toDouble(),
      cardId: json['card_id'] as int? ?? 0,
      sender: SenderModel.fromJson(json["sender"]),
    );
  }
}