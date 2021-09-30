class CommentModel {
  int id;
  int idUser;
  String name;
  String conten;
  int likes;
  String creatat;
  CommentModel(
      {this.id, this.idUser, this.name, this.conten, this.likes, this.creatat});

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json['id'],
        name: json['name'],
        idUser: json['created_by'],
        conten: json['content'],
        likes: json['likes'],
        creatat: json['created_at'] == null ? null : json['created_at'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_by": idUser,
        "conten": conten,
        "likes": likes,
        "creatat": creatat == null ? null : creatat,
      };
}
