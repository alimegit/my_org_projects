import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/local/locals.dart';
import '../data/model/message_model.dart';
import 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState(messages: messageModels));

  insertMessage({required MessageModel messageModel}) {
    List<MessageModel> a = state.messages;
    a.add(messageModel);
    emit(state.copyWith(messages: a));
  }

  removeMessage({required MessageModel messageModel}) {
    List<MessageModel> a = state.messages;
    a.remove(messageModel);
    emit(state.copyWith(messages: a));
  }

  sortMessage({required int contactId}) {
    List<MessageModel> a = state.messages.where((element) {
      if (contactId == element.messageId) {
        return true;
      }
      return false;
    }).toList();
    return a;
  }
}
