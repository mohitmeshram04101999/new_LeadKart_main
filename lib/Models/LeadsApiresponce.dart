// To parse this JSON data, do
//
//     final leadsApiResponce = leadsApiResponceFromJson(jsonString);

import 'dart:convert';

LeadsApiResponce leadsApiResponceFromJson(String str) => LeadsApiResponce.fromJson(json.decode(str));

String leadsApiResponceToJson(LeadsApiResponce data) => json.encode(data.toJson());

class LeadsApiResponce {
  bool? success;
  String? message;
  List<Lead>? data;

  LeadsApiResponce({
    this.success,
    this.message,
    this.data,
  });

  factory LeadsApiResponce.fromJson(Map<String, dynamic> json) => LeadsApiResponce(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Lead>.from(json["data"]!.map((x) => Lead.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Lead {
  String? id;
  String? businessId;
  String? adsetId;
  String? adId;
  String? pageId;
  String? leadgenId;
  dynamic formId;
  String? createdTime;
  String? leadSource;
  String? userContactNumber;
  String? name;
  String? email;
  String? whatsappNumber;
  String? leadStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? note;

  Lead({
    this.id,
    this.businessId,
    this.adsetId,
    this.adId,
    this.pageId,
    this.leadgenId,
    this.formId,
    this.createdTime,
    this.leadSource,
    this.userContactNumber,
    this.name,
    this.email,
    this.whatsappNumber,
    this.leadStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.note,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
    id: json["_id"],
    businessId: json["businessId"],
    adsetId: json["adsetId"],
    adId: json["adId"],
    pageId: json["pageId"],
    leadgenId: json["leadgenId"],
    formId: json["formId"],
    createdTime: json["createdTime"],
    leadSource: json["leadSource"],
    userContactNumber: json["userContactNumber"],
    name: json["name"],
    email: json["email"],
    whatsappNumber: json["whatsappNumber"],
    leadStatus: json["leadStatus"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    note: json["note"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "businessId": businessId,
    "adsetId": adsetId,
    "adId": adId,
    "pageId": pageId,
    "leadgenId": leadgenId,
    "formId": formId,
    "createdTime": createdTime,
    "leadSource": leadSource,
    "userContactNumber": userContactNumber,
    "name": name,
    "email": email,
    "whatsappNumber": whatsappNumber,
    "leadStatus": leadStatus,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
