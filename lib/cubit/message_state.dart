
import '../data/model/message_model.dart';

class MessageState {
  List<MessageModel> messages;

  MessageState({required this.messages});

  MessageState copyWith({List<MessageModel>? messages}) {
    return MessageState(messages: messages ?? this.messages);
  }
}