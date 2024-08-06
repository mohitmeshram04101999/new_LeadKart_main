// To parse this JSON data, do
//
//     final verifySubUsersOtpApiResponce = verifySubUsersOtpApiResponceFromJson(jsonString);

import 'dart:convert';

VerifySubUsersOtpApiResponce verifySubUsersOtpApiResponceFromJson(String str) => VerifySubUsersOtpApiResponce.fromJson(json.decode(str));

String verifySubUsersOtpApiResponceToJson(VerifySubUsersOtpApiResponce data) => json.encode(data.toJson());

class VerifySubUsersOtpApiResponce {
  String? status;
  bool? success;
  String? message;
  SubUserData? data;

  VerifySubUsersOtpApiResponce({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory VerifySubUsersOtpApiResponce.fromJson(Map<String, dynamic> json) => VerifySubUsersOtpApiResponce(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : SubUserData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class SubUserData {
  String? id;
  dynamic name;
  dynamic mobile;
  dynamic image;
  String? email;
  String? userType;
  bool? phoneVerified;
  bool? emailVerified;
  dynamic password;
  String? otp;
  dynamic roleId;
  String? businessId;
  bool? disable;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? token;

  SubUserData({
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
    this.businessId,
    this.disable,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
  });

  factory SubUserData.fromJson(Map<String, dynamic> json) => SubUserData(
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
    businessId: json["businessId"],
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
    "businessId": businessId,
    "disable": disable,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "token": token,
  };
}
