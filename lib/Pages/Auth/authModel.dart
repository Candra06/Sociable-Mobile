class Auth {
  Auth({
    this.id,
    this.username,
    this.email,
    this.password,
    this.phone,
    this.role,
    this.birthDate,
    this.levelDiagnosa,
    this.gender,
    this.token,
  });

  int id;
  String username;
  String email;
  String password;
  String phone;
  String role;
  DateTime birthDate;
  String levelDiagnosa;
  String gender;
  String token;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        role: json["role"] == null ? null : json["role"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        levelDiagnosa: json["level_diagnosa"] == null ? null : json["level_diagnosa"],
        gender: json["gender"] == null ? null : json["gender"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "birth_date": birthDate == null ? null : "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "password": password == null ? null : password,
        "gender": gender == null ? null : gender,
      };

  Map<String, dynamic> loginBody() => {
        "username": username == null ? null : username,
        "password": password == null ? null : password,
      };
}
