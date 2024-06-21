// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpModel verifyOtpModelFromJson(String str) => VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  bool? success;
  String? message;
  CurruntUser? userCred;

  VerifyOtpModel({
    this.success,
    this.message,
    this.userCred,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
    success: json["success"],
    message: json["message"],
    userCred: json["data"] == null ? null : CurruntUser.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": userCred?.toJson(),
  };
}

class CurruntUser {
  String? id;
  dynamic name;
  int? mobile;
  dynamic image;
  dynamic email;
  String? userType;
  bool? phoneVerified;
  bool? emailVerified;
  dynamic password;
  String? otp;
  dynamic roleId;
  bool? disable;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? token;

  CurruntUser({
    this.id,
    this.name,
    this.mobile,
    this.image,
    this.email,
    this.userType,
    this.phoneVerified,
    this.emailVerified,
    this.password,
    this.otp,
    this.roleId,
    this.disable,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
  });

  factory CurruntUser.fromJson(Map<String, dynamic> json) => CurruntUser(
    id: json["_id"],
    name: json["name"],
    mobile: json["mobile"],
    image: json["image"],
    email: json["email"],
    userType: json["userType"],
    phoneVerified: json["phoneVerified"],
    emailVerified: json["emailVerified"],
    password: json["password"],
    otp: json["otp"],
    roleId: json["roleId"],
    disable: json["disable"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "mobile": mobile,
    "image": image,
    "email": email,
    "userType": userType,
    "phoneVerified": phoneVerified,
    "emailVerified": emailVerified,
    "password": password,
    "otp": otp,
    "roleId": roleId,
    "disable": disable,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "token": token,
  };
}
