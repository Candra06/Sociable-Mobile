class DetailForum {
    DetailForum({
        this.status,
        this.data,
        this.reply,
    });

    bool status;
    Data data;
    List<Data> reply;

    factory DetailForum.fromJson(Map<String, dynamic> json) => DetailForum(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        reply: json["reply"] == null ? null : List<Data>.from(json["reply"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
        "reply": reply == null ? null : List<dynamic>.from(reply.map((x) => x.toJson())),
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
        this.idReff,
    });

    int id;
    String topic;
    String content;
    int likes;
    int createdBy;
    String anonim;
    DateTime createdAt;
    DateTime updatedAt;
    int idReff;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        topic: json["topic"] == null ? null : json["topic"],
        content: json["content"] == null ? null : json["content"],
        likes: json["likes"] == null ? null : json["likes"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        anonim: json["anonim"] == null ? null : json["anonim"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        idReff: json["id_reff"] == null ? null : json["id_reff"],
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
        "id_reff": idReff == null ? null : idReff,
    };
}
