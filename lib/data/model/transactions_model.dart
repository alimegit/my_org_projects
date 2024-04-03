import 'package:default_project/data/model/sender_model.dart';
import 'package:default_project/data/model/data_model.dart'; // Make sure to import the DataModel class

class TransactionsModel {
  final String trData;
  final DataModel data;
  final SenderModel senderModel;

  TransactionsModel({
    required this.trData,
    required this.data,
    required this.senderModel,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    return TransactionsModel(
      trData: json['trData'] ?? '',
      data: DataModel.fromJson(json['data'] ?? {}),
      senderModel: SenderModel.fromJson(json['senderModel'] ?? {}),
    );
  }
}
