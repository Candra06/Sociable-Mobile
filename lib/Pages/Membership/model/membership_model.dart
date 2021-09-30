class Membership {
    Membership({
        this.status,
        this.message,
        this.data,
    });

    bool status;
    String message;
    Data data;

    factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.idUser,
        this.amount,
        this.paymentStatus,
        this.proofPayment,
        this.startDate,
        this.expDate,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int idUser;
    int amount;
    String paymentStatus;
    String proofPayment;
    DateTime startDate;
    DateTime expDate;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        idUser: json["id_user"] == null ? null : json["id_user"],
        amount: json["amount"] == null ? null : json["amount"],
        paymentStatus: json["payment_status"] == null ? null : json["payment_status"],
        proofPayment: json["proof_payment"] == null ? null : json["proof_payment"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        expDate: json["exp_date"] == null ? null : DateTime.parse(json["exp_date"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "id_user": idUser == null ? null : idUser,
        "amount": amount == null ? null : amount,
        "payment_status": paymentStatus == null ? null : paymentStatus,
        "proof_payment": proofPayment == null ? null : proofPayment,
        "start_date": startDate == null ? null : startDate.toIso8601String(),
        "exp_date": expDate == null ? null : expDate.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
