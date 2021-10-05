class Room {
  Room({
    this.message,
    this.username,
    this.idRoom,
    this.receiver,
    this.createdAt,
  });

  String message;
  String username;
  int receiver;
  int idRoom;
  DateTime createdAt;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        message: json["message"] == null ? null : json["message"],
        username: json["username"] == null ? null : json["username"],
        idRoom: json["id_room"] == null ? null : json["id_room"],
        receiver: json["receiver"] == null ? null : json["receiver"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "username": username == null ? null : username,
        "id_room": idRoom == null ? null : idRoom,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}
