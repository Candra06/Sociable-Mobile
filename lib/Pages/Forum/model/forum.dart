// To parse this JSON data, do
//
//     final forum = forumFromJson(jsonString);

class Forum {
  Forum({
    this.status,
    this.id,
    this.topic,
    this.content,
    this.likes,
    this.createdBy,
    this.name,
    this.anonim,
    this.createdAt,
    this.updatedAt,
    this.data,
  });

  bool status;
  int id;
  String topic;
  String content;
  String name;
  int likes;
  int createdBy;
  String anonim;
  DateTime createdAt;
  DateTime updatedAt;
  List<Data> data;

  // factory Forum.fromJson(Map<String, dynamic> json) => Forum(
  //       status: json["status"] == null ? null : json["status"],
  //       data: json["data"] == null ? null : List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "status": status == null ? null : status,
  //       "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  //     };
  factory Forum.fromJson(Map<String, dynamic> json) => Forum(
        id: json["id"] == null ? null : json["id"],
        topic: json["topic"] == null ? null : json["topic"],
        name: json["name"] == null ? null : json["name"],
        content: json["content"] == null ? null : json["content"],
        likes: json["likes"] == null ? null : json["likes"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        anonim: json["anonim"] == null ? null : json["anonim"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "topic": topic == null ? null : topic,
        "name": name == null ? null : name,
        "content": content == null ? null : content,
        "likes": likes == null ? null : likes,
        "created_by": createdBy == null ? null : createdBy,
        "anonim": anonim == null ? null : anonim,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class Data {
  Data({
    this.id,
    this.topic,
    this.content,
    this.likes,
    this.createdBy,
    this.anonim,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String topic;
  String content;
  int likes;
  int createdBy;
  String anonim;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        topic: json["topic"] == null ? null : json["topic"],
        content: json["content"] == null ? null : json["content"],
        likes: json["likes"] == null ? null : json["likes"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        anonim: json["anonim"] == null ? null : json["anonim"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "topic": topic == null ? null : topic,
        "content": content == null ? null : content,
        "likes": likes == null ? null : likes,
        "created_by": createdBy == null ? null : createdBy,
        "anonim": anonim == null ? null : anonim,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
