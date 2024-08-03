// To parse this JSON data, do
//
//     final getAllSubUsersApiResponce = getAllSubUsersApiResponceFromJson(jsonString);

import 'dart:convert';

GetAllSubUsersApiResponce getAllSubUsersApiResponceFromJson(String str) =>
    GetAllSubUsersApiResponce.fromJson(json.decode(str));

String getAllSubUsersApiResponceToJson(GetAllSubUsersApiResponce data) =>
    json.encode(data.toJson());

class GetAllSubUsersApiResponce {
  String? status;
  bool? success;
  String? message;
  List<SubUsers>? data;
  int? page;

  GetAllSubUsersApiResponce({
    this.status,
    this.success,
    this.message,
    this.data,
    this.page,
  });

  factory GetAllSubUsersApiResponce.fromJson(Map<String, dynamic> json) =>
      GetAllSubUsersApiResponce(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SubUsers>.from(json["data"]!.map((x) => SubUsers.fromJson(x))),
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "page": page,
      };
}

class SubUsers {
  String? id;
  String? name;
  dynamic mobile;
  String? image;
  String? email;
  String? userType;
  bool? phoneVerified;
  bool? emailVerified;
  String? password;
  String? otp;
  Map<String,dynamic>? roleId;
  String? businessId;
  bool? disable;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  SubUsers({
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
  });

  factory SubUsers.fromJson(Map<String, dynamic> json) => SubUsers(
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
      };
}
