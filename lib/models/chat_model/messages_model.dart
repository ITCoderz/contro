class MessagesModel {
  String image, number, messages, messageType;
  bool isUserMessage;

  MessagesModel({
    required this.image,
    required this.number,
    required this.messages,
    required this.messageType,
    required this.isUserMessage,
  });
}
