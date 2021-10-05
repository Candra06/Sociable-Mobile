class DetailRoom {
  DetailRoom({
    this.id,
    this.idRoom,
    this.sender,
    this.receiver,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int idRoom;
  int sender;
  int receiver;
  String message;
  DateTime createdAt;
  DateTime updatedAt;

  factory DetailRoom.fromJson(Map<String, dynamic> json) => DetailRoom(
        id: json["id"] == null ? null : json["id"],
        idRoom: json["id_room"] == null ? null : json["id_room"],
        sender: json["sender"] == null ? null : json["sender"],
        receiver: json["receiver"] == null ? null : json["receiver"],
        message: json["message"] == null ? null : json["message"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "sender": sender == null ? null : sender.toString(),
        "receiver": receiver == null ? null : receiver.toString(),
        "message": message == null ? null : message,
      };
}
