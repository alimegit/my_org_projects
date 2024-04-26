class MessageModel {
  final int messageId;
  final String messageText;
  final bool isFile;
  final String sendTime;
  final int contactId;
  final bool status;

  MessageModel({
    required this.sendTime,
    required this.messageText,
    required this.messageId,
    required this.isFile,
    required this.contactId,
    required this.status,
  });
}