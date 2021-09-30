class Challenge {
  Challenge({
    this.id,
    this.idUser,
    this.idChallenge,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.levelDiagnosa,
    this.day,
    this.content,
    this.description,
  });

  int id;
  int idUser;
  int idChallenge;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String levelDiagnosa;
  int day;
  String content;
  String description;

  factory Challenge.fromJson(Map<String, dynamic> json) => Challenge(
        id: json["id"] == null ? null : json["id"],
        idUser: json["id_user"] == null ? null : json["id_user"],
        idChallenge: json["id_challenge"] == null ? null : json["id_challenge"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        levelDiagnosa: json["level_diagnosa"] == null ? null : json["level_diagnosa"],
        day: json["day"] == null ? null : json["day"],
        content: json["content"] == null ? null : json["content"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "id_user": idUser == null ? null : idUser,
        "id_challenge": idChallenge == null ? null : idChallenge,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "level_diagnosa": levelDiagnosa == null ? null : levelDiagnosa,
        "day": day == null ? null : day,
        "content": content == null ? null : content,
      };
}
