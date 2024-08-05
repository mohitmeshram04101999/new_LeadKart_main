// To parse this JSON data, do
//
//     final getRoleForSubUserApiResponce = getRoleForSubUserApiResponceFromJson(jsonString);

import 'dart:convert';

GetRoleForSubUserApiResponce getRoleForSubUserApiResponceFromJson(String str) => GetRoleForSubUserApiResponce.fromJson(json.decode(str));

String getRoleForSubUserApiResponceToJson(GetRoleForSubUserApiResponce data) => json.encode(data.toJson());

class GetRoleForSubUserApiResponce {
  bool? success;
  String? message;
  List<Role>? data;

  GetRoleForSubUserApiResponce({
    this.success,
    this.message,
    this.data,
  });

  factory GetRoleForSubUserApiResponce.fromJson(Map<String, dynamic> json) => GetRoleForSubUserApiResponce(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Role>.from(json["data"]!.map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Role {
  String? id;
  String? roleName;
  List<Permission>? permissions;
  String? businessId;
  int? v;

  Role({
    this.id,
    this.roleName,
    this.permissions,
    this.businessId,
    this.v,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["_id"],
    roleName: json["roleName"],
    permissions: json["permissions"] == null ? [] : List<Permission>.from(json["permissions"]!.map((x) => Permission.fromJson(x))),
    businessId: json["businessId"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "roleName": roleName,
    "permissions": permissions == null ? [] : List<dynamic>.from(permissions!.map((x) => x.toJson())),
    "businessId": businessId,
    "__v": v,
  };
}

class Permission {
  List<String>? ads;
  List<String>? rolesPermission;
  List<String>? leads;

  Permission({
    this.ads,
    this.rolesPermission,
    this.leads,
  });

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
    ads: json["Ads"] == null ? [] : List<String>.from(json["Ads"]!.map((x) => x)),
    rolesPermission: json["Roles&Permission"] == null ? [] : List<String>.from(json["Roles&Permission"]!.map((x) => x)),
    leads: json["Leads"] == null ? [] : List<String>.from(json["Leads"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Ads": ads == null ? [] : List<dynamic>.from(ads!.map((x) => x)),
    "Roles&Permission": rolesPermission == null ? [] : List<dynamic>.from(rolesPermission!.map((x) => x)),
    "Leads": leads == null ? [] : List<dynamic>.from(leads!.map((x) => x)),
  };
}
