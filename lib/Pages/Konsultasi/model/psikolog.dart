class Psikolog {
    Psikolog({
        this.id,
        this.username,
        this.email,
        this.birthDate,
        this.phone,
        this.gender,
        this.role,
        this.levelDiagnosa,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String username;
    String email;
    DateTime birthDate;
    String phone;
    String gender;
    String role;
    String levelDiagnosa;
    DateTime createdAt;
    DateTime updatedAt;

    factory Psikolog.fromJson(Map<String, dynamic> json) => Psikolog(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        phone: json["phone"] == null ? null : json["phone"],
        gender: json["gender"] == null ? null : json["gender"],
        role: json["role"] == null ? null : json["role"],
        levelDiagnosa: json["level_diagnosa"] == null ? null : json["level_diagnosa"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "birth_date": birthDate == null ? null : "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "phone": phone == null ? null : phone,
        "gender": gender == null ? null : gender,
        "role": role == null ? null : role,
        "level_diagnosa": levelDiagnosa == null ? null : levelDiagnosa,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
