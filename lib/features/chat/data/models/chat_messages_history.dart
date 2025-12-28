class ChatMessagesHistory {
  final String text;
  final bool isUser;
  final String sender;
  final String time;

  ChatMessagesHistory({
    required this.text,
    required this.isUser,
    required this.sender,
    required this.time,
  });

  factory ChatMessagesHistory.fromMap(Map<String, dynamic> map) {
    return ChatMessagesHistory(
      text: map['text'],
      isUser: map['isUser'],
      sender: map['sender'],
      time: map['time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'text': text, 'isUser': isUser, 'sender': sender, 'time': time};
  }

  factory ChatMessagesHistory.fromJson(Map<String, dynamic> json) {
    return ChatMessagesHistory(
      text: json['text'],
      isUser: json['isUser'],
      sender: json['sender'],
      time: json['time'],
    );
  }
}
