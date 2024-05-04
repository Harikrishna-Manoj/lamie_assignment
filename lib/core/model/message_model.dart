class MessageModel {
  MessageModel({
    required this.id,
    required this.senderEmail,
    required this.message,
    required this.threadName,
    required this.timestamp,
    required this.senderDelete,
    required this.receiverDelete,
    required this.sender,
    required this.receiver,
  });

  final int? id;
  final String? senderEmail;
  final String? message;
  final String? threadName;
  final DateTime? timestamp;
  final bool? senderDelete;
  final bool? receiverDelete;
  final int? sender;
  final int? receiver;

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json["id"],
      senderEmail: json["sender_email"],
      message: json["message"],
      threadName: json["thread_name"],
      timestamp: DateTime.tryParse(json["timestamp"] ?? ""),
      senderDelete: json["sender_delete"],
      receiverDelete: json["receiver_delete"],
      sender: json["sender"],
      receiver: json["receiver"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "sender_email": senderEmail,
        "message": message,
        "thread_name": threadName,
        "timestamp": timestamp?.toIso8601String(),
        "sender_delete": senderDelete,
        "receiver_delete": receiverDelete,
        "sender": sender,
        "receiver": receiver,
      };
}
