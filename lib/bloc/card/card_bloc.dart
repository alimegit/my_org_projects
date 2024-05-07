


import 'package:default_project/bloc/card/card_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/forms/form_status.dart';
import '../../data/models/card_model.dart';
import '../../data/models/network_response.dart';
import '../../data/repositories/card_repository.dart';
import 'card_state.dart';

class CardBloc extends Bloc<UserCardsEvent, CardsState> {
  CardBloc(this.cardRepository)
      : super(
    const CardsState(
      userCards: [],
      status: FormStatus.pure,
      errorMessage: "",
      statusMessage: "",
      cardsDb: [],
    ),
  ) {
    on<AddCardEvent>(_addCard);
    on<DeleteCardEvent>(_deleteCard);
    on<UpdateCardEvent>(_updateCard);
    on<GetCardsUserByIdEvent>(_listenCardUser);
    on<GetCardsDatabaseEvent>(_listenCardDatabase);
  }

  final CardsRepository cardRepository;

  Future<void> _addCard(AddCardEvent event, emit) async {
    NetworkResponse networkResponse = NetworkResponse();

    emit(state.copyWith(status: FormStatus.loading));

    networkResponse =
    await cardRepository.addCard(event.cardModel);

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormStatus.success));
    } else {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  Future<void> _deleteCard(DeleteCardEvent event, emit) async {
    NetworkResponse networkResponse = NetworkResponse();

    emit(state.copyWith(status: FormStatus.loading));

    networkResponse =
    await cardRepository.deleteCard(event.cardModel.cardId);

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormStatus.success));
    } else {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  Future<void> _updateCard(UpdateCardEvent event, emit) async {
    NetworkResponse networkResponse = NetworkResponse();

    emit(state.copyWith(status: FormStatus.loading));

    networkResponse =
    await cardRepository.updateCard(event.cardModel);

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormStatus.success));
    } else {
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  _listenCardUser(GetCardsUserByIdEvent event, Emitter emit) async {
    debugPrint("_listenCardUser  keldi ----------------------");
    debugPrint("DocId:  ${event.userId} ----------------------");
    await emit
        .onEach(cardRepository.getCardsByUserId(event.userId),
        onData: (List<CardModel> userCards) {
          emit(state.copyWith(userCards: userCards));
        });
  }

  _listenCardDatabase(GetCardsDatabaseEvent event,Emitter emit)async{
    await emit.onEach(
        cardRepository.getCardsDatabase(),
        onData:(List<CardModel> db){
          emit(state.copyWith(cardsDb: db));
        }
    );
  }
}
