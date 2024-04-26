import '../model/contact_model.dart';
import '../model/message_model.dart';

List<ContactModel> allContacts = [
  ContactModel(
    contactId: 1,
    contactLasName: " Urinov ",
    contactName: "Ali",
    isOnline: false,
    imageUrl:
    "https://okmusic.online/uploads/posts/2022-05/1651938447_1638285926_shohjahon-jorayev.jpg",
    lastOnlineTime: DateTime.now(),
  ),
  ContactModel(
    contactId: 3,
    contactLasName: "Falonchiyev",
    contactName: "Falonchi",
    isOnline: false,
    imageUrl:"https://static.vecteezy.com/system/resources/previews/009/383/461/non_2x/man-face-clipart-design-illustration-free-png.png",
    lastOnlineTime: DateTime.now(),
  ),
  ContactModel(
    contactId: 2,
    contactLasName: "QodirALiiyev",
    contactName: "Chingiz",
    isOnline: false,
    imageUrl:
    "",
    lastOnlineTime: DateTime.now(),
  ),
];

List<MessageModel> messageModels = [
  MessageModel(
    sendTime: DateTime.now().toString(),
    messageText: 'Makkamik',
    messageId: 2,
    isFile: false,
    contactId: 2,
    status: false,
  ),
  MessageModel(
    sendTime: DateTime.now().toString(),
    messageText: 'Qonday',
    messageId: 2,
    isFile: false,
    contactId: 111,
    status: false,
  ),
  MessageModel(
    sendTime: DateTime.now().toString(),
    messageText:
    '',
    messageId: 1,
    isFile: false,
    contactId: 1,
    status: false,
  ),
  MessageModel(
    sendTime: DateTime.now().toString(),
    messageText: "Voalykum assalom Bo'ldi Okma o'zim habarlashaman...",
    messageId: 1,
    isFile: false,
    contactId: 111,
    status: false,
  ),
];
