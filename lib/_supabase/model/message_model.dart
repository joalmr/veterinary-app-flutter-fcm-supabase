class MessageModel {
  MessageModel({
    this.id,
    this.canalId,
    this.message,
    this.type,
    this.sendAt,
  });

  int? id;
  int? canalId;
  String? message;
  bool? type;
  DateTime? sendAt;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json['id'] as int?,
        canalId: json['canal_id'] as int?,
        message: json['message'] as String?,
        type: json['type'] as bool?,
        sendAt: DateTime?.parse(json['send_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'canal_id': canalId,
        'message': message,
        'type': type,
        'send_at': sendAt?.toIso8601String() ?? DateTime.now(),
      };
}
