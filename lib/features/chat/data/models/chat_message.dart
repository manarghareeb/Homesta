class ChatMessage {
  final String text;
  final bool isUser;
  final String sender;
  final String time;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.sender,
    required this.time,
  });

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      text: map['text'],
      isUser: map['isUser'],
      sender: map['sender'],
      time: map['time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'isUser': isUser,
      'sender': sender,
      'time': time,
    };
  }
}
