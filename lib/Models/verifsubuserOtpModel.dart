// To parse this JSON data, do
//
//     final verifySubUsersOtpApiResponce = verifySubUsersOtpApiResponceFromJson(jsonString);

import 'dart:convert';

VerifySubUsersOtpApiResponse verifySubUsersOtpApiResponceFromJson(String str) =>
    VerifySubUsersOtpApiResponse.fromJson(json.decode(str));

String verifySubUsersOtpApiResponceToJson(VerifySubUsersOtpApiResponse data) =>
    json.encode(data.toJson());

class VerifySubUsersOtpApiResponse {
  String? status;
  bool? success;
  MessageData? message;

  VerifySubUsersOtpApiResponse({
    this.status,
    this.success,
    this.message,
  });

  factory VerifySubUsersOtpApiResponse.fromJson(Map<String, dynamic> json) =>
      VerifySubUsersOtpApiResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"] == null
            ? null
            : MessageData.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message?.toJson(),
      };
}

class MessageData {
  String? memberId;
  int? status;

  MessageData({
    this.memberId,
    this.status,
  });

  factory MessageData.fromJson(Map<String, dynamic> json) => MessageData(
        memberId: json["memberId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "memberId": memberId,
        "status": status,
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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
