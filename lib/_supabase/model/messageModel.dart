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
        id: json["id"],
        canalId: json["canal_id"],
        message: json["message"],
        type: json["type"],
        sendAt: DateTime.parse(json["send_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "canal_id": canalId,
        "message": message,
        "type": type,
        "send_at": sendAt!.toIso8601String(),
    };
}
