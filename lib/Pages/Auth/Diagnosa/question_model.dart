class Question {
  Question({
    this.id,
    this.questions,
    this.question,
    this.createdAt,
    this.updatedAt,
    this.point,
    this.data,
    this.status,
  });

  int id;
  String questions;
  String question;
  String point;
  String data;
  String status;
  dynamic createdAt;
  dynamic updatedAt;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"] == null ? null : json["id"],
        questions: json["questions"] == null ? null : json["questions"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  factory Question.diagnosa(Map<String, dynamic> json) => Question(
        point: json["point"] == null ? null : json["point"],
        data: json["data"] == null ? null : json["data"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "question": question == null ? null : question,
        "poin": point,
      };
}
