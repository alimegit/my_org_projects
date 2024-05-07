


import 'package:equatable/equatable.dart';

import '../../data/forms/form_status.dart';
import '../../data/models/card_model.dart';

class CardsState extends Equatable {

  final List<CardModel> userCards;
  final List<CardModel> cardsDb;
  final FormStatus status;
  final String errorMessage;
  final String statusMessage;


  const CardsState({
    required this.status,
    required this.userCards,
    required this.statusMessage,
    required this.errorMessage,
    required this.cardsDb
  });

  CardsState copyWith({
    List<CardModel>? userCards,
    List<CardModel>? cardsDb,
    FormStatus? status,
    String? statusMessage,
    String? errorMessage
  }){
    return CardsState(
        userCards: userCards ?? this.userCards,
        cardsDb: cardsDb ?? this.cardsDb,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }


  @override
  List<Object> get props => [
    status,
    userCards,
    statusMessage,
    errorMessage,
    cardsDb
  ];
}
